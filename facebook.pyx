#!python
#cython: language_level=3
STUFF = "Hi"
from libc.stdio cimport printf
from cpython.ref cimport Py_INCREF
from libcpp cimport bool


cdef extern from "FacebookController.h":
    ctypedef void (*typedefCB)(const char *status, const char *error, void *python_obj, void *python_cb)
    void Login(typedefCB call_back, void *python_obj,void *python_cb)
    void GetGraphPath(typedefCB call_back, void *python_obj, void *python_cb, char* field)
    void SharePhoto(char* path)

class Facebook:
    def __init__(self):
        pass

    def login_user(self, python_obj, callback):
        Login(objc_cb, <void*>python_obj, <void*>callback)

    def get_graph_path(self, field, python_obj, callback):
        cdef bytes field_bytes = field.encode('utf-8')
        GetGraphPath(objc_cb, <void*>python_obj, <void*>callback, field_bytes)

    def share_photo(self, path):
        cdef bytes path_bytes = path.encode('utf-8')
        SharePhoto(path_bytes)
        

cdef void objc_cb(const char *status, const char *error, void *python_obj, void *python_cb) with gil:
    printf("%s\n", status)
    printf("%s\n", error)
    if status:
        status_pystr = (status.decode('utf-8'))
    else:
        status_pystr = ''
    if error:
        error_pystr  = (error.decode('utf-8'))
    else:
        error_pystr = ''
    print("Token %s\n", status_pystr)
    print("Error %s\n", error_pystr)
    (<object>python_cb)(<object>python_obj, status_pystr, error_pystr)