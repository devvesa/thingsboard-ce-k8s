#!/bin/bash
#
# Copyright © 2016-2020 The Thingsboard Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

kubectl delete -f routes.yml

kubectl -n thingsboard delete svc,sts,deploy,cm,po,ing --all

kubectl -n thingsboard get pvc --no-headers=true | awk '//{print $1}' | xargs kubectl -n thingsboard delete --ignore-not-found=true pvc