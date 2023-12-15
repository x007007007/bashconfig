#!/bin/bash
# @file env.sh
# @brief 环境配置脚本
# @description
#   开发规范
#     1. 以`__` + 驼峰明明方式保存
#     2. 支持 https://github.com/reconquest/shdoc 方式文档
#   功能包括
#     * 追加可执行程序搜索路径的函数,防止重复添加
#     * 清理搜了路径,保留存在,不重复的搜索路径信息


# @description 追加可执行程序搜索路径的函数,防止重复添加
#
# @example
#    __appendSearchNotExistPath /usr/sbin
#
#
function __appendSearchNotExistPath () {
  local new_path currentPaths exist_path
  new_path=$1
  IFS=':' read -r -a currentPaths <<< "$PATH"
  for exist_path in ${currentPaths[*]} ; do
    if [[ "${exist_path}" -ef "${new_path}" ]] ; then
      return 1
    fi
  done
  currentPaths+=("${new_path}")
  export PATH=$(IFS=: ; echo "${currentPaths[*]}")
  return 0
}


function __insertSearchNotExistPath () {
  local new_path currentPaths exist_path
  new_path=$1
  IFS=':' read -r -a currentPaths <<< "$PATH"
  for exist_path in ${currentPaths[*]} ; do
    if [[ "${exist_path}" -ef "${new_path}" ]] ; then
      return 1
    fi
  done
  currentPaths=("${new_path}" "${currentPaths[*]}")
  export PATH=$(IFS=: ; echo "${currentPaths[*]}")
  return 0
}

# @description 清理现有搜索路径
# 1. 保留存在的路径
# 2. 确保不重复
#
# @example
#    __cleanSearchPath
#
function __cleanSearchPath () {
  local currentPaths
  local exist_path
  local existPaths
  IFS=':' read -r -a currentPaths <<< "$PATH"
  declare -a existPaths

  for exist_path in ${currentPaths[*]} ; do
    if [[ -e "${exist_path}" ]] ; then
      if  [[ ! ${existPaths[*]} =~ [[:space:]]${exist_path}[[:space:]] ]]; then
        existPaths+=( "${exist_path}" )
      fi
    fi
  done
  export PATH=$(IFS=: ; echo "${existPaths[*]}")
}

