# Copyright (C) 2015 The SaberMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# Copyright (C) 2015 The SaberMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_ENABLE_NEST := \
	art \
	libsigchain \
	libart \
	libartd \
	libartd-compiler \
 	libart-disassembler \
	libartd-disassembler \
	core.art-host \
	core.art \
	cpplint-art-phony \
	libnativebridgetest \
	libarttest \
	art-run-tests \
	libart-gtest \
	libc \
	libc_bionic \
	libc_gdtoa \
	libc_netbsd \
	libc_freebsd \
	libc_dns \
	libc_openbsd \
	libc_cxa \
	libc_syscalls \
	libc_aeabi \
	libc_common \
	libc_nomalloc \
	libc_malloc \
	libc_stack_protector \
	libc_tzcode \
	libstdc++ \
	linker \
	libdl \
	libm \
	tzdata \
	bionic-benchmarks
	
ifeq (1,$(words $(filter $(LOCAL_ENABLE_NEST), $(LOCAL_MODULE))))
  ifdef LOCAL_CONLYFLAGS
    LOCAL_CONLYFLAGS += \
	-floop-nest-optimize
  else
    LOCAL_CONLYFLAGS := \
	-floop-nest-optimize
  endif

  ifdef LOCAL_CPPFLAGS
    LOCAL_CPPFLAGS += \
	-floop-nest-optimize
  else
    LOCAL_CPPFLAGS := \
	-floop-nest-optimize
  endif
endif
