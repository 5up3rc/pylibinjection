#
# pylibinjection.pyx
#
# Copyright(c) 2013 Angelo Dell'Aera <buffer@antifork.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
# MA  02111-1307  USA

cimport pylibinjection

__version__ = '0.0.1'

cdef bint fn(const_char_ptr arg):
    return True

cdef class SQLInjection:
    def __cinit__(self):
        pass

    def run(self, linebuf, length):
        cdef c_sfilter *sfp = <c_sfilter *>malloc(sizeof(c_sfilter))

        length = sqli_qs_normalize(linebuf, length)
        return is_sqli(sfp, 
                       linebuf, 
                       length,
                       <ptr_fingerprints_fn>fn)
