import subprocess
import os

dnf_packages = {
        "development": ['git', 'vim']
        }

aptget_packages = {
        "development": ['git', 'vim']
        }

def get_pkg_manager():
    """TODO: Make this func modular, so that more package managers
    can be added."""

    command = ["apt-get"]
    exit_code = subprocess.call(command,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
                shell=True)
    if exit_code == 0:
        return "apt-get"
    else:
        return "dnf"

def main():
    pkg_manager = get_pkg_manager()
    if pkg_manager == "dnf":
        packages = " ".join(dnf_packages['development'])
    elif pkg_manager == "apt-get":
        packages = " ".join(aptget_packages['development'])


    cmd = f"sudo {pkg_manager} install {packages}"
    subprocess.Popen(cmd, shell=True).wait()


if __name__ == "__main__":
    main()


class SetupZSH:
    def __init__(self):
        pass


class SetupVim:
    def __init__(self):
        pass
