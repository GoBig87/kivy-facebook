STUFF = "Hi"
from libc.stdio cimport printf
from cpython.ref cimport Py_INCREF
from libcpp cimport bool


cdef extern from "FacebookLoginButton.h":
    ctypedef void(*callbackfunc)(const char * token)
    void PressFacebookButton(callbackfunc call_back, void *_util)


class LoginButton():
    def __init__(self,util):
        self.util = util

    def get_token(self):
        PressFacebookButton(callback, <void*> self.util)


cdef void callback(const char *token, void *util):
    (<object> util).FacebookToken = (token.decode('utf-8'))

