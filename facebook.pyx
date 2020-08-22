#!python
#cython: language_level=3
STUFF = "Hi"
from libc.stdio cimport printf
from cpython.ref cimport Py_INCREF
from libcpp cimport bool


cdef extern from "FacebookLoginButton.h":
    ctypedef void (*callbackfunc)(const char *status, const char *error, void *_util)
    void Login(callbackfunc call_back, void *_util)


class FacebookLogin:
    def __init__(self, callback):
        self.callback = callback

    def login_user(self):
        Login(callback, <void*>self)

    def send_status(self, token, error):
        if error:
            print("Error:%s" % error)
            self.callback(error)
        if token:
            print("Token:%s" % token)
            self.callback(token)
        print("Kivy-Facebook: Token and Error are null")


cdef void callback(const char *status, const char *error, void *util) with gil:
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
    (<object>util).send_status(status_pystr, error_pystr)