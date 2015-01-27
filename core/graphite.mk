# Copyright (C) 2014-2015 The SaberMod Project
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

GRAPHITE_FLAGS := \
   -fgraphite \
   -fgraphite-identity \
   -floop-flatten \
   -floop-parallelize-all \
   -ftree-loop-linear \
   -floop-interchange \
   -floop-strip-mine \
   -floop-block \
   -Wno-error=maybe-uninitialized

# Force disable some modules that are not compatible with graphite flags
LOCAL_DISABLE_GRAPHITE := \
   libunwind \
   libFFTEm \
   libicui18n \
   libskia \
   libvpx \
   libmedia_jni \
   libstagefright_mp3dec \
   libart \
   mdnsd \
   libwebrtc_spl \
   third_party_WebKit_Source_core_webcore_svg_gyp \
   libjni_filtershow_filters \
   libavformat \
   libavcodec \
   fio \
   WhisperPush \
   Eleven \
   Email \
   libwebviewchromium \
   libwebviewchromium_loader \
   libwebviewchromium_plat_support \
   unrar \
   libc_common \
   libncurses

ifneq (1,$(words $(filter $(LOCAL_DISABLE_GRAPHITE),$(LOCAL_MODULE))))
  ifdef LOCAL_CONLYFLAGS
    LOCAL_CONLYFLAGS += $(GRAPHITE_FLAGS)
  else
    LOCAL_CONLYFLAGS := $(GRAPHITE_FLAGS)
  endif

  ifdef LOCAL_CPPFLAGS
    LOCAL_CPPFLAGS += $(GRAPHITE_FLAGS)
  else
    LOCAL_CPPFLAGS := $(GRAPHITE_FLAGS)
  endif

  ifndef LOCAL_LDFLAGS
    LOCAL_LDFLAGS  := $(GRAPHITE_FLAGS)
  else
    LOCAL_LDFLAGS  += $(GRAPHITE_FLAGS)
  endif
endif
#####
