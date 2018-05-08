
env
------

```
# cat /etc/system-release
Amazon Linux release 2 (2017.12) LTS Release Candidate
```

repo
------
```
# sudo yum-config-manager \
>     --add-repo \
>     https://download.docker.com/linux/centos/docker-ce.repo
Loaded plugins: langpacks, priorities, update-motd
adding repo from: https://download.docker.com/linux/centos/docker-ce.repo
grabbing file https://download.docker.com/linux/centos/docker-ce.repo to /etc/yum.repos.d/docker-ce.repo
repo saved to /etc/yum.repos.d/docker-ce.repo
```
```
# sudo yum-config-manager --enable docker-ce-edge
```

install docker
-------
```
#  sudo yum install docker-ce
Loaded plugins: langpacks, priorities, update-motd
Resolving Dependencies
--> Running transaction check
---> Package docker-ce.x86_64 0:18.05.0.ce-2.1.rc1.el7.centos will be installed
--> Processing Dependency: container-selinux >= 2.9 for package: docker-ce-18.05.0.ce-2.1.rc1.el7.centos.x86_64
--> Processing Dependency: pigz for package: docker-ce-18.05.0.ce-2.1.rc1.el7.centos.x86_64
--> Processing Dependency: libltdl.so.7()(64bit) for package: docker-ce-18.05.0.ce-2.1.rc1.el7.centos.x86_64
--> Running transaction check
---> Package docker-ce.x86_64 0:18.05.0.ce-2.1.rc1.el7.centos will be installed
--> Processing Dependency: container-selinux >= 2.9 for package: docker-ce-18.05.0.ce-2.1.rc1.el7.centos.x86_64
---> Package libtool-ltdl.x86_64 0:2.4.2-22.2.amzn2 will be installed
---> Package pigz.x86_64 0:2.3.4-1.amzn2 will be installed
--> Finished Dependency Resolution
Error: Package: docker-ce-18.05.0.ce-2.1.rc1.el7.centos.x86_64 (docker-ce-test)
           Requires: container-selinux >= 2.9
 You could try using --skip-broken to work around the problem
 You could try running: rpm -Va --nofiles --nodigest
```

need container-selinux

http://mirror.centos.org/centos/7/extras/x86_64/Packages/
```
# wget "http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.42-1.gitad8f0f7.el7.noarch.rpm"
# rpm -Uvh container-selinux-2.42-1.gitad8f0f7.el7.noarch.rpm
```

```
# sudo yum install docker-ce
```

build gvisor
------------

```
yum install -y gcc gcc-c++ bazel
```

```
git clone https://gvisor.googlesource.com/gvisor gvisor
cd gvisor
```

```
bazel build runsc
INFO: Analysed target //runsc:runsc (0 packages loaded).
INFO: Found 1 target...
ERROR: /root/.cache/bazel/_bazel_root/b4a6b971b553ff6e5ffe7760c9348cdd/external/com_google_protobuf/BUILD:274:1: undeclared inclusion(s) in rule '@com_google_protobuf//:protoc_lib':
this rule is missing dependency declarations for the following files included by 'external/com_google_protobuf/src/google/protobuf/compiler/csharp/csharp_doc_comment.cc':
  '/usr/include/stdc-predef.h'
  '/usr/include/c++/7/string'
  '/usr/include/c++/7/x86_64-redhat-linux/bits/c++config.h'
  '/usr/include/c++/7/x86_64-redhat-linux/bits/os_defines.h'
  '/usr/include/features.h'
  '/usr/include/sys/cdefs.h'
  '/usr/include/bits/wordsize.h'
  '/usr/include/bits/long-double.h'
  '/usr/include/gnu/stubs.h'
  '/usr/include/gnu/stubs-64.h'
  '/usr/include/c++/7/x86_64-redhat-linux/bits/cpu_defines.h'
  '/usr/include/c++/7/bits/stringfwd.h'
  '/usr/include/c++/7/bits/memoryfwd.h'
  '/usr/include/c++/7/bits/char_traits.h'
  '/usr/include/c++/7/bits/stl_algobase.h'
  '/usr/include/c++/7/bits/functexcept.h'
  '/usr/include/c++/7/bits/exception_defines.h'
  '/usr/include/c++/7/bits/cpp_type_traits.h'
  '/usr/include/c++/7/ext/type_traits.h'
  '/usr/include/c++/7/ext/numeric_traits.h'
  '/usr/include/c++/7/bits/stl_pair.h'
  '/usr/include/c++/7/bits/move.h'
  '/usr/include/c++/7/bits/concept_check.h'
  '/usr/include/c++/7/type_traits'
  '/usr/include/c++/7/bits/stl_iterator_base_types.h'
  '/usr/include/c++/7/bits/stl_iterator_base_funcs.h'
  '/usr/include/c++/7/debug/assertions.h'
  '/usr/include/c++/7/bits/stl_iterator.h'
  '/usr/include/c++/7/bits/ptr_traits.h'
  '/usr/include/c++/7/debug/debug.h'
  '/usr/include/c++/7/bits/predefined_ops.h'
  '/usr/include/c++/7/bits/postypes.h'
  '/usr/include/c++/7/cwchar'
  '/usr/include/wchar.h'
  '/usr/include/bits/libc-header-start.h'
  '/usr/include/bits/floatn.h'
  '/usr/lib/gcc/x86_64-redhat-linux/7/include/stddef.h'
  '/usr/lib/gcc/x86_64-redhat-linux/7/include/stdarg.h'
  '/usr/include/bits/wchar.h'
  '/usr/include/bits/types/wint_t.h'
  '/usr/include/bits/types/mbstate_t.h'
  '/usr/include/bits/types/__mbstate_t.h'
  '/usr/include/bits/types/__FILE.h'
  '/usr/include/bits/types/FILE.h'
  '/usr/include/bits/types/locale_t.h'
  '/usr/include/bits/types/__locale_t.h'
  '/usr/include/bits/wchar2.h'
  '/usr/include/c++/7/cstdint'
  '/usr/lib/gcc/x86_64-redhat-linux/7/include/stdint.h'
  '/usr/include/stdint.h'
  '/usr/include/bits/types.h'
  '/usr/include/bits/typesizes.h'
  '/usr/include/bits/stdint-intn.h'
  '/usr/include/bits/stdint-uintn.h'
  '/usr/include/c++/7/bits/allocator.h'
  '/usr/include/c++/7/x86_64-redhat-linux/bits/c++allocator.h'
  '/usr/include/c++/7/ext/new_allocator.h'
  '/usr/include/c++/7/new'
  '/usr/include/c++/7/exception'
  '/usr/include/c++/7/bits/exception.h'
  '/usr/include/c++/7/bits/exception_ptr.h'
  '/usr/include/c++/7/bits/cxxabi_init_exception.h'
  '/usr/include/c++/7/typeinfo'
  '/usr/include/c++/7/bits/hash_bytes.h'
  '/usr/include/c++/7/bits/nested_exception.h'
  '/usr/include/c++/7/bits/localefwd.h'
  '/usr/include/c++/7/x86_64-redhat-linux/bits/c++locale.h'
  '/usr/include/c++/7/clocale'
  '/usr/include/locale.h'
  '/usr/include/bits/locale.h'
  '/usr/include/c++/7/iosfwd'
  '/usr/include/c++/7/cctype'
  '/usr/include/ctype.h'
  '/usr/include/endian.h'
  '/usr/include/bits/endian.h'
  '/usr/include/bits/byteswap.h'
  '/usr/include/bits/byteswap-16.h'
  '/usr/include/bits/uintn-identity.h'
  '/usr/include/c++/7/bits/ostream_insert.h'
  '/usr/include/c++/7/bits/cxxabi_forced.h'
  '/usr/include/c++/7/bits/stl_function.h'
  '/usr/include/c++/7/backward/binders.h'
  '/usr/include/c++/7/bits/range_access.h'
  '/usr/include/c++/7/initializer_list'
  '/usr/include/c++/7/bits/basic_string.h'
  '/usr/include/c++/7/ext/atomicity.h'
  '/usr/include/c++/7/x86_64-redhat-linux/bits/gthr.h'
  '/usr/include/c++/7/x86_64-redhat-linux/bits/gthr-default.h'
  '/usr/include/pthread.h'
  '/usr/include/sched.h'
  '/usr/include/bits/types/time_t.h'
  '/usr/include/bits/types/struct_timespec.h'
  '/usr/include/bits/sched.h'
  '/usr/include/bits/cpu-set.h'
  '/usr/include/time.h'
  '/usr/include/bits/time.h'
  '/usr/include/bits/timex.h'
  '/usr/include/bits/types/struct_timeval.h'
  '/usr/include/bits/types/clock_t.h'
  '/usr/include/bits/types/struct_tm.h'
  '/usr/include/bits/types/clockid_t.h'
  '/usr/include/bits/types/timer_t.h'
  '/usr/include/bits/types/struct_itimerspec.h'
  '/usr/include/bits/pthreadtypes.h'
  '/usr/include/bits/thread-shared-types.h'
  '/usr/include/bits/pthreadtypes-arch.h'
  '/usr/include/bits/setjmp.h'
  '/usr/include/c++/7/x86_64-redhat-linux/bits/atomic_word.h'
  '/usr/include/c++/7/ext/alloc_traits.h'
  '/usr/include/c++/7/bits/alloc_traits.h'
  '/usr/include/c++/7/ext/string_conversions.h'
  '/usr/include/c++/7/cstdlib'
  '/usr/include/stdlib.h'
  '/usr/include/bits/waitflags.h'
  '/usr/include/bits/waitstatus.h'
  '/usr/include/sys/types.h'
  '/usr/include/sys/select.h'
  '/usr/include/bits/select.h'
  '/usr/include/bits/types/sigset_t.h'
  '/usr/include/bits/types/__sigset_t.h'
  '/usr/include/bits/select2.h'
  '/usr/include/sys/sysmacros.h'
  '/usr/include/bits/sysmacros.h'
  '/usr/include/alloca.h'
  '/usr/include/bits/stdlib-bsearch.h'
  '/usr/include/bits/stdlib-float.h'
  '/usr/include/bits/stdlib.h'
  '/usr/include/c++/7/bits/std_abs.h'
  '/usr/include/c++/7/cstdio'
  '/usr/include/stdio.h'
  '/usr/include/libio.h'
  '/usr/include/_G_config.h'
  '/usr/include/bits/stdio_lim.h'
  '/usr/include/bits/sys_errlist.h'
  '/usr/include/bits/stdio.h'
  '/usr/include/bits/stdio2.h'
  '/usr/include/c++/7/cerrno'
  '/usr/include/errno.h'
  '/usr/include/bits/errno.h'
  '/usr/include/linux/errno.h'
  '/usr/include/asm/errno.h'
  '/usr/include/asm-generic/errno.h'
  '/usr/include/asm-generic/errno-base.h'
  '/usr/include/c++/7/bits/functional_hash.h'
  '/usr/include/c++/7/bits/basic_string.tcc'
  '/usr/include/c++/7/map'
  '/usr/include/c++/7/bits/stl_tree.h'
  '/usr/include/c++/7/ext/aligned_buffer.h'
  '/usr/include/c++/7/bits/stl_map.h'
  '/usr/include/c++/7/tuple'
  '/usr/include/c++/7/utility'
  '/usr/include/c++/7/bits/stl_relops.h'
  '/usr/include/c++/7/array'
  '/usr/include/c++/7/stdexcept'
  '/usr/include/c++/7/bits/uses_allocator.h'
  '/usr/include/c++/7/bits/invoke.h'
  '/usr/include/c++/7/bits/stl_multimap.h'
  '/usr/include/c++/7/vector'
  '/usr/include/c++/7/bits/stl_construct.h'
  '/usr/include/c++/7/bits/stl_uninitialized.h'
  '/usr/include/c++/7/bits/stl_vector.h'
  '/usr/include/c++/7/bits/stl_bvector.h'
  '/usr/include/c++/7/bits/vector.tcc'
  '/usr/include/c++/7/algorithm'
  '/usr/include/c++/7/bits/stl_algo.h'
  '/usr/include/c++/7/bits/algorithmfwd.h'
  '/usr/include/c++/7/bits/stl_heap.h'
  '/usr/include/c++/7/bits/stl_tempbuf.h'
  '/usr/include/c++/7/bits/uniform_int_dist.h'
  '/usr/include/c++/7/limits'
  '/usr/include/c++/7/iostream'
  '/usr/include/c++/7/ostream'
  '/usr/include/c++/7/ios'
  '/usr/include/c++/7/bits/ios_base.h'
  '/usr/include/c++/7/bits/locale_classes.h'
  '/usr/include/c++/7/bits/locale_classes.tcc'
  '/usr/include/c++/7/system_error'
  '/usr/include/c++/7/x86_64-redhat-linux/bits/error_constants.h'
  '/usr/include/c++/7/streambuf'
  '/usr/include/c++/7/bits/streambuf.tcc'
  '/usr/include/c++/7/bits/basic_ios.h'
  '/usr/include/c++/7/bits/locale_facets.h'
  '/usr/include/c++/7/cwctype'
  '/usr/include/wctype.h'
  '/usr/include/bits/wctype-wchar.h'
  '/usr/include/c++/7/x86_64-redhat-linux/bits/ctype_base.h'
  '/usr/include/c++/7/bits/streambuf_iterator.h'
  '/usr/include/c++/7/x86_64-redhat-linux/bits/ctype_inline.h'
  '/usr/include/c++/7/bits/locale_facets.tcc'
  '/usr/include/c++/7/bits/basic_ios.tcc'
  '/usr/include/c++/7/bits/ostream.tcc'
  '/usr/include/c++/7/istream'
  '/usr/include/c++/7/bits/istream.tcc'
  '/usr/include/c++/7/set'
  '/usr/include/c++/7/bits/stl_set.h'
  '/usr/include/c++/7/bits/stl_multiset.h'
  '/usr/include/assert.h'
  '/usr/include/c++/7/stdlib.h'
  '/usr/include/c++/7/cstddef'
  '/usr/include/string.h'
  '/usr/include/strings.h'
  '/usr/include/bits/strings_fortified.h'
  '/usr/include/bits/string_fortified.h'
  '/usr/include/sys/param.h'
  '/usr/lib/gcc/x86_64-redhat-linux/7/include/limits.h'
  '/usr/lib/gcc/x86_64-redhat-linux/7/include/syslimits.h'
  '/usr/include/limits.h'
  '/usr/include/bits/posix1_lim.h'
  '/usr/include/bits/local_lim.h'
  '/usr/include/linux/limits.h'
  '/usr/include/bits/posix2_lim.h'
  '/usr/include/bits/xopen_lim.h'
  '/usr/include/bits/uio_lim.h'
  '/usr/include/signal.h'
  '/usr/include/bits/signum.h'
  '/usr/include/bits/signum-generic.h'
  '/usr/include/bits/types/sig_atomic_t.h'
  '/usr/include/bits/types/siginfo_t.h'
  '/usr/include/bits/types/sigval_t.h'
  '/usr/include/bits/siginfo-arch.h'
  '/usr/include/bits/siginfo-consts.h'
  '/usr/include/bits/siginfo-consts-arch.h'
  '/usr/include/bits/types/sigevent_t.h'
  '/usr/include/bits/sigevent-consts.h'
  '/usr/include/bits/sigaction.h'
  '/usr/include/bits/sigcontext.h'
  '/usr/include/bits/types/stack_t.h'
  '/usr/include/sys/ucontext.h'
  '/usr/include/bits/sigstack.h'
  '/usr/include/bits/ss_flags.h'
  '/usr/include/bits/types/struct_sigstack.h'
  '/usr/include/bits/sigthread.h'
  '/usr/include/bits/param.h'
  '/usr/include/linux/param.h'
  '/usr/include/asm/param.h'
  '/usr/include/asm-generic/param.h'
  '/usr/include/byteswap.h'
  '/usr/include/c++/7/memory'
  '/usr/include/c++/7/bits/stl_raw_storage_iter.h'
  '/usr/include/c++/7/ext/concurrence.h'
  '/usr/include/c++/7/bits/unique_ptr.h'
  '/usr/include/c++/7/bits/shared_ptr.h'
  '/usr/include/c++/7/bits/shared_ptr_base.h'
  '/usr/include/c++/7/bits/allocated_ptr.h'
  '/usr/include/c++/7/bits/refwrap.h'
  '/usr/include/c++/7/bits/shared_ptr_atomic.h'
  '/usr/include/c++/7/bits/atomic_base.h'
  '/usr/include/c++/7/bits/atomic_lockfree_defines.h'
  '/usr/include/c++/7/backward/auto_ptr.h'
  '/usr/include/c++/7/unordered_map'
  '/usr/include/c++/7/bits/hashtable.h'
  '/usr/include/c++/7/bits/hashtable_policy.h'
  '/usr/include/c++/7/bits/unordered_map.h'
  '/usr/include/c++/7/unordered_set'
  '/usr/include/c++/7/bits/unordered_set.h'
Target //runsc:runsc failed to build
Use --verbose_failures to see the command lines of failed build steps.
INFO: Elapsed time: 1.235s, Critical Path: 0.79s
INFO: 0 processes.
FAILED: Build did NOT complete successfully
```

