import os

def file_size(fname):
    statinfo = os.stat(fname)
    return statinfo.st_size

print('File Size: ', file_size('SourceControl.txt'))