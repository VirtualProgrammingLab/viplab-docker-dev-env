#!/bin/bash

ECS_Category=devel

export ECS_CURLOPT_CAINFO=
export ECS_RESOURCE_PREFIX=numlab

# HTTP Basic Auth and its credentials
export ECS_HTTPBasicAuth=true
#FILE_ViP_credentials=./.ViP_credentials

# service
export ECS_Credential_S_CC=
# devel backend'n'frontend
export ECS_Credential_D_CC=
# backend test
export ECS_Credential_T_CC=
export ECS_Credential_T_TC=
export ECS_Credential_T_SC=
# monitoring
export ECS_Credential_MON=

export ECS_Credential=$ECS_Credential_D_CC

# protocol_prefix, credential_prefix, host:port
export ECS_ProtocolPrefix=http://
export ECS_AddressPort=$HOSTNAME
export ECS_IPAddressPort=
export ECS_ProtocolAddressPort=$ECS_ProtocolPrefix$ECS_AddressPort
export ECS_ProtocolIPAddressPort=$ECS_ProtocolPrefix$ECS_IPAddressPort

exec Scripts/startCC --run-as-service --debug --prestart-Octave --prestart-Matlab --prestart-flipping $VIP_CC_EXTRA_PARAMS