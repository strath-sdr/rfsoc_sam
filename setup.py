import os
import shutil
from distutils.dir_util import copy_tree

from setuptools import find_packages, setup

# global variables
board = os.environ['BOARD']
repo_board_folder = f'boards/{board}/rfsoc_sam'
board_notebooks_dir = os.environ['PYNQ_JUPYTER_NOTEBOOKS']
board_project_dir = os.path.join(board_notebooks_dir, 'spectrum_analyser')

# check whether board is supported
def check_env():
    if not (board == 'ZCU111' or board == 'RFSOC'):
        raise ValueError("Board {} is not supported.".format(board))
        
# check if the path already exists, delete if so
def check_path():
    if os.path.exists(board_project_dir):
        shutil.rmtree(board_project_dir)

# copy overlays to python package
def copy_overlays():
    src_ol_dir = os.path.join(repo_board_folder, 'bitstream')
    dst_ol_dir = os.path.join(board_project_dir, 'bitstream')
    copy_tree(src_ol_dir, dst_ol_dir)

# copy notebooks to jupyter home
def copy_notebooks():
    src_nb_dir = os.path.join(repo_board_folder, 'notebooks')
    dst_nb_dir = os.path.join(board_project_dir)
    copy_tree(src_nb_dir, dst_nb_dir)
    
check_env()
check_path()
copy_overlays()
copy_notebooks()

setup(
    name="rfsoc_sam",
    version='1.0',
    install_requires=[
        'pynq>=2.5',
    ],
    url='https://github.com/strath-sdr/rfsoc_sam',
    license='BSD 3-Clause License',
    author="Lewis Davin McLaughlin",
    author_email="lewis.mclaughlin@strath.ac.uk",
    packages=find_packages(),
    description="PYNQ example of using the RFSoC as a Spectrum Analyser.")
