
bash_intelligent_root=$HOME/.bash
bash_template_path=${bash_intelligent_root}/template

function bash_config_change_checker () {
	local filepath=$1
	if [[ ! -f ${filepath} ]]; then
		echo ERROR config ${filepath} not exist 1>&2
		return
        fi
        local filename=$(basename $filepath)
	local template_filepath=${bash_template_path}/${filename:1}
        if [[ ! -f ${template_filepath} ]]; then
		echo ERROR Template ${template_filepath} not exist 1>&2
		return
	fi
        local output_file=${bash_intelligent_root}/changelog/${filename:1}-$(date +%y%m%d_%H%M%S).bash
        if [[ -n $(diff "${filepath}" "$template_filepath") ]]; then
        	diff "${filepath}" "${template_filepath}" |grep "<" |cut -d' ' -f2-  > ${output_file}
                echo Find ${filepath} have change generate change log at ${output_file}
        	cp -f "${template_filepath}" "${filepath}"
        fi
}


bash_config_change_checker ${HOME}/.bashrc
