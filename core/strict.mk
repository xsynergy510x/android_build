# Copyright (C) 2014 The SaberMod Project
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

# Force disable strict aliasing for some modules
LOCAL_DISABLE_STRICT := \
	libc_bionic \
	libc_dns \
	libc_tzcode \
	libziparchive \
	libtwrpmtp \
	libfusetwrp \
	libguitwrp \
	busybox \
	libuclibcrpc \
	libziparchive-host \
	libpdfiumcore \
	libandroid_runtime \
	libmedia \
	libpdfiumcore \
	libpdfium \
	bluetooth.default \
	logd \
	mdnsd \
	net_net_gyp \
	libstagefright_webm \
	libaudioflinger \
	libmediaplayerservice \
	libstagefright \
	ping \
	ping6 \
	libdiskconfig \
	libjavacore \
	libfdlibm \
	libvariablespeed \
	librtp_jni \
	libwilhelm \
	libdownmix \
	libldnhncr \
	libqcomvisualizer \
	libvisualizer \
	libstlport \
	libutils \
	libandroidfw \
	dnsmasq \
	static_busybox \
	libwebviewchromium \
	libwebviewchromium_loader \
	libwebviewchromium_plat_support \
	content_content_renderer_gyp \
	third_party_WebKit_Source_modules_modules_gyp \
	third_party_WebKit_Source_platform_blink_platform_gyp \
	third_party_WebKit_Source_core_webcore_remaining_gyp \
	third_party_angle_src_translator_lib_gyp \
	third_party_WebKit_Source_core_webcore_generated_gyp \
	libc_gdtoa \
	libc_openbsd \
	libc \
	libc_nomalloc \
	patchoat \
	dex2oat \
	libart \
	libart-compiler \
	oatdump \
	libart-disassembler \
	libminivold \
	libstlport_static \
	libcrypto_static \
	libfuse \
	libbusybox \
	gatt_testtool \
	libssh \
	ssh \
	mm-vdec-omx-test \
	audio.primary.msm8960 \
	lsof

STRICT_ALIAS := \
   -fstrict-aliasing \
   -Werror=strict-aliasing 

ifneq (1,$(words $(filter $(LOCAL_DISABLE_STRICT),$(LOCAL_MODULE))))
  ifdef LOCAL_CFLAGS
    LOCAL_CFLAGS += $(STRICT_ALIAS)
  else
    LOCAL_CFLAGS := $(STRICT_ALIAS)
  endif

  ifdef LOCAL_CPPFLAGS
    LOCAL_CPPFLAGS += $(STRICT_ALIAS)
  else
    LOCAL_CPPFLAGS := $(STRICT_ALIAS)
  endif

  ifdef LOCAL_CONLYFLAGS
    LOCAL_CONLYFLAGS += $(STRICT_ALIAS)
  else
    LOCAL_CONLYFLAGS := $(STRICT_ALIAS)
  endif

  ifndef LOCAL_CLANG
    LOCAL_CONLYFLAGS += -Wstrict-aliasing=3
    LOCAL_CPPFLAGS += -Wstrict-aliasing=3
  else
    LOCAL_CONLYFLAGS += -Wstrict-aliasing=2
    LOCAL_CPPFLAGS += -Wstrict-aliasing=2
  endif
endif

LOCAL_FORCE_DISABLE_STRICT := \
        libziparchive-host \
        libziparchive \
        libdiskconfig \
        logd \
        libjavacore

ifeq (1,$(words $(filter $(LOCAL_FORCE_DISABLE_STRICT),$(LOCAL_MODULE))))
  ifdef LOCAL_CONLYFLAGS
    LOCAL_CONLYFLAGS +=	-fno-strict-aliasing
  else
    LOCAL_CONLYFLAGS :=	-fno-strict-aliasing
  endif

  ifdef LOCAL_CPPFLAGS
    LOCAL_CPPFLAGS += -fno-strict-aliasing
  else
    LOCAL_CPPFLAGS := -fno-strict-aliasing
  endif
endif
#####
