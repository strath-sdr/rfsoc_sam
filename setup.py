import os
import shutil
from distutils.dir_util import copy_tree

from setuptools import find_packages, setup

# global variables
board = os.environ['BOARD']
repo_board_folder = f'boards/{board}/rfsoc_sam'
board_notebooks_dir = os.environ['PYNQ_JUPYTER_NOTEBOOKS']
board_project_dir = os.path.join(board_notebooks_dir, 'spectrum_analyser')
hw_data_files = []
assets = []

# check whether board is supported
def check_env():
    if not os.path.isdir(repo_board_folder):
        raise ValueError("Board {} is not supported.".format(board))
    if not os.path.isdir(board_notebooks_dir):
        raise ValueError(
            "Directory {} does not exist.".format(board_notebooks_dir))
        
# check if the path already exists, delete if so
def check_path():
    if os.path.exists(board_project_dir):
        shutil.rmtree(board_project_dir)

# copy overlays to python package
def copy_overlays():
    src_ol_dir = os.path.join(repo_board_folder, 'bitstream')
    dst_ol_dir = os.path.join('rfsoc_sam', 'bitstream')
    copy_tree(src_ol_dir, dst_ol_dir)
    hw_data_files.extend(
        [os.path.join("..", dst_ol_dir, f) for f in os.listdir(dst_ol_dir)])

# copy assets to python package
def copy_assets():
    src_at_dir = os.path.join(repo_board_folder, 'notebooks', 'assets')
    dst_at_dir = os.path.join('rfsoc_sam', 'assets')
    copy_tree(src_at_dir, dst_at_dir)
    assets.extend(
        [os.path.join("..", dst_at_dir, f) for f in os.listdir(dst_at_dir)])

# copy board specific drivers
def copy_drivers():
    src_dr_dir = os.path.join(repo_board_folder, 'drivers')
    dst_dr_dir = os.path.join('rfsoc_sam')
    copy_tree(src_dr_dir, dst_dr_dir)

# copy notebooks to jupyter home
def copy_notebooks():
    src_nb_dir = os.path.join(repo_board_folder, 'notebooks')
    dst_nb_dir = os.path.join(board_project_dir)
    copy_tree(src_nb_dir, dst_nb_dir)
    
check_env()
check_path()
copy_overlays()
copy_assets()
copy_drivers()
copy_notebooks()

setup(
    name="rfsoc_sam",
    version='0.2',
    install_requires=[
        'pynq>=2.6',
    ],
    url='https://github.com/strath-sdr/rfsoc_sam',
    license='BSD 3-Clause License',
    author="Lewis Davin McLaughlin",
    author_email="lewis.mclaughlin@strath.ac.uk",
    packages=find_packages(),
    package_data={
        '': hw_data_files,
        '': assets,
    }
    description="PYNQ example of using the RFSoC as a Spectrum Analyser.")
