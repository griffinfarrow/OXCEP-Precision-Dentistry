import importlib
import subprocess
import sys

def install_if_missing(package_name: str, pip_name: str = None, verbose: bool = True):
    """
    Checks if a package is installed, and installs it if not.
    Usage: e.g.
    install_if_missing("lifelines")
    """
    pip_name = pip_name or package_name
    try:
        importlib.import_module(package_name)
        if verbose: 
            print(f"'{package_name}' is already installed.")
    except ImportError:
        if verbose:
            print(f"Installing '{pip_name}'...")
        subprocess.check_call([sys.executable, "-m", "pip", "install", pip_name])
