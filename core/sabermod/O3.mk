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

# Disable some modules that break with -O3
LOCAL_DISABLE_O3 := \
   	libaudioflinger

O3_FLAGS := \
   	-O3 \
   	-Wno-error=array-bounds \
   	-Wno-error=strict-overflow

ifneq (1,$(words $(filter $(LOCAL_DISABLE_O3),$(LOCAL_MODULE))))
    ifdef LOCAL_CFLAGS
        LOCAL_CFLAGS += $(O3_FLAGS)
    else      
        LOCAL_CFLAGS := $(O3_FLAGS)
    endif
else
    ifdef LOCAL_CFLAGS
        LOCAL_CFLAGS += -O2
    else
        LOCAL_CFLAGS := -O2
    endif
endif
