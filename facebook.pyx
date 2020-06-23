STUFF = "Hi"
from libc.stdio cimport printf
from cpython.ref cimport Py_INCREF
from libcpp cimport bool

cdef extern from "facebook_sdk.h":
    ctypedef void (*callbackfunc)(const char *status, const char *error, void *_util)
    void Login(callbackfunc call_back, void *_util)


class FacebookLogin():
    def __init__(self,util):
        self.util = util

    def login_user(self):
        Login(callback, <void*>self.util)


cdef void callback(const char *status, const char *error, void *util):
    status_pystr = (status.decode('utf-8'))
    error_pystr  = (error.decode('utf-8'))
    (<object>util).send_status(status_pystr, error_pystr)

