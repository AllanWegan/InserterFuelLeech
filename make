#! /usr/bin/env python3
# This file is part of the mod InserterFuelLeech that is licensed under the
# GNU GPL-3.0. See the file COPYING for a copy of the GNU GPLv3.0.

import argparse, os, stat, glob, json, shutil, subprocess

def parse_mod_info(src_dir: str) -> dict:
    with open(os.path.join(src_dir, "info.json"), "r") as info_file:
        mod_info = json.load(info_file)
        return mod_info

def remove_fs_obj(p: str, indent: str) -> None:
    if os.path.isdir(p):
        for e in glob.iglob(os.path.join(p, "*")):
            remove_fs_obj(e, indent)
        print(f'{indent}Deleting folder "{p}"...')
        os.rmdir(p)
    else:
        print(f'{indent}Deleting file "{p}"...')
        os.remove(p)

def copy_fs_obj(src_path: str, dst_path: str, indent: str) -> None:
    if os.path.isdir(src_path):
        print(f'{indent}Creating folder "{dst_path}"...')
        os.mkdir(dst_path)
        for e in glob.iglob(os.path.join(src_path, "*")):
            e_dst_path = os.path.join(dst_path, os.path.basename(e))
            copy_fs_obj(e, e_dst_path, indent)
    else:
        print(f'{indent}Copying file "{src_path}" to "{dst_path}"...')
        shutil.copy(src_path, dst_path)

def chmod_fs_obj(p: str, flags: int, indent: str) -> None:
    if os.path.isdir(p):
        for e in glob.iglob(os.path.join(p, '*')):
            chmod_fs_obj(e, flags, indent)
        print(f'{indent}Setting access rights on folder "{p}"...')
        if flags & (stat.S_IRUSR|stat.S_IWUSR):
            flags |= stat.S_IXUSR
        if flags & (stat.S_IRGRP|stat.S_IWGRP):
            flags |= stat.S_IXGRP
        if flags & (stat.S_IROTH|stat.S_IWOTH):
            flags |= stat.S_IXOTH
        os.chmod(p, flags)
    else:
        print(f'{indent}Setting access rights on file "{p}"...')
        os.chmod(p, flags)

def cleanup(bin_dir: str) -> None:
    print(f'Emptying "{bin_dir}"...')
    for p in glob.iglob(os.path.join(bin_dir, "*")):
        remove_fs_obj(p, " ")
    print('Folder emptied.')

def make_mod_dir(src_dir: str, bin_dir: str, mod_ver_name: str) -> str:
    mod_dir = os.path.join(bin_dir, mod_ver_name)
    print(f'Creating and filling mod folder "{mod_dir}"...')
    if not os.path.isdir(bin_dir):
        print(" bin folder doesn't - creating...")
        os.mkdir(bin_dir)
    if os.path.isdir(mod_dir):
        print(' Mod folder already exists - deleting...')
        remove_fs_obj(mod_dir, '  ')
    print(' Creating folder...')
    os.mkdir(mod_dir)
    print(' Adding tree from src folder...')
    for e in glob.iglob(os.path.join(src_dir, '*')):
        name = os.path.basename(e)
        copy_fs_obj(e, os.path.join(mod_dir, name), '  ')
    src_dir = os.path.dirname(src_dir)
    print(' Adding additional files...')
    for name in ('COPYING', 'README'):
        src_path = os.path.join(src_dir, name)
        dest_path = os.path.join(mod_dir, name)
        copy_fs_obj(src_path, dest_path, '  ')
    print('Mod folder complete.')
    return mod_dir

def package_mod_dir(mod_dir: str) -> str:
    mod_name = os.path.basename(mod_dir)
    package_name = mod_name + '.zip'
    package_dir = os.path.dirname(mod_dir)
    package_path = os.path.join(package_dir, package_name)
    print(f'Packaging mod into "{package_path}"...')
    if os.path.isfile(package_path):
        print(' Package already exists - removing...')
        remove_fs_obj(package_path, '  ')
    print(' Invoking 7z to create package...')
    args = ('7z', 'a', '-tzip', package_name, mod_name)
    subprocess.run(args, cwd=package_dir, check=True)
    print('Package complete.')
    return package_path

def check_game_mods_dir(game_mods_dir: str) -> None:
    if not os.path.isdir(game_mods_dir):
        print("Mods folder doesn't exist!")
        exit(1)

def uninstall_package(package_name: str, game_mods_dir: str) -> None:
    print(f'Uninstalling package "{package_name}" from game mods folder "{game_mods_dir}...')
    check_game_mods_dir(game_mods_dir)
    for e in glob.iglob(os.path.join(game_mods_dir, package_name + '*')):
        remove_fs_obj(e, ' ')
    print('Done.')

def install_package(package_path: str, game_mods_dir: str) -> None:
    print(f'Installing packaging "{package_path}" into game mods folder "{game_mods_dir}...')
    check_game_mods_dir(game_mods_dir)
    package_name = os.path.basename(package_path)
    dest_path = os.path.join(game_mods_dir, package_name)
    if os.path.exists(dest_path):
        remove_fs_obj(dest_path, ' ')
    copy_fs_obj(package_path, dest_path, ' ')
    print(' Setting package world accessible...')
    flags = (stat.S_IRUSR|stat.S_IWUSR | stat.S_IRGRP|stat.S_IWGRP
    | stat.S_IROTH|stat.S_IWOTH)
    chmod_fs_obj(dest_path, flags, '  ')
    print('Package installed.')

def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('cmd', choices=('clean', 'package')
    , help='Command to execute. "clean" for emptying the bin folder.'
        '"zip" for making the zip (default)')
    parser.add_argument('-i', dest='install', default=False
    , action='store_true'
    , help='If cmd is "package", also install the mod into the game mods folder.'
        ' The game is expected to reside in ../game .')
    parser.add_argument('-I', dest='install_dev', default=False
    , action='store_true'
    , help='If cmd is "package", also install the mod as folder into the game mods folder.'
        ' The game is expected to reside in ../game .')
    parser.add_argument('-r', dest='run_game', default=False
    , action='store_true'
    , help='If cmd is "package", also run the game. The game is expected to reside in ../game .')
    return parser.parse_args()

def main() -> None:
    args = parse_args()
    cmd = args.cmd
    base_dir = os.path.dirname(__file__)
    src_dir = os.path.join(base_dir, 'src')
    bin_dir = os.path.join(base_dir, 'bin')
    game_dir = os.path.join(base_dir, '..', 'game')
    game_mods_dir = os.path.join(game_dir, 'mods')
    game_executable_path = os.path.join(game_dir, 'bin', 'x64', 'factorio')
    if cmd == 'clean':
        cleanup(bin_dir)
    elif cmd == 'package':
        mod_info = parse_mod_info(src_dir)
        mod_name = mod_info['name']
        mod_version = mod_info['version']
        mod_ver_name = f'{mod_name}_{mod_version}'
        mod_dir = make_mod_dir(src_dir, bin_dir, mod_ver_name)
        package_path = package_mod_dir(mod_dir)
        if args.install:
            uninstall_package(mod_ver_name, game_mods_dir)
            install_package(package_path, game_mods_dir)
        elif args.install_dev:
            uninstall_package(mod_ver_name, game_mods_dir)
            install_package(mod_dir, game_mods_dir)
        if args.run_game:
            subprocess.run((game_executable_path,), cwd=game_dir, check=True)

if __name__ == '__main__':
    main()
