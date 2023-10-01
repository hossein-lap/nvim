#!/usr/bin/env bash
#  _  _ ___
# | || | __| P
# | __ | _|
# |_||_|___| J
#

## varaibles {{{
#prompt=$(echo ${0} | awk -F '/' '{print $NF;}')
## }}}
## help function {{{
#help() {
#cat << EOF
#${prompt}: what problem is this script solving
#
#usage: [-h] [-i input] [-o output]
#
#    • arguemts:
#        -i --input      intput x
#        -o --output     output y
#        -s --style      launcher style
#        -e --args       extra args (to pass to the launcher)
#        -h --help       print this message
#
#    • example:
#        ${prompt} -i in -o out
#
#    • running without any arguments will show this message
#EOF
#}
## }}}
## argument parsing {{{
#while [ "${#}" -gt 0 ]; do
#	case ${1} in
#		-i|--input)
#			input="${2}"
#			shift
#			;;
#		-o|--output)
#			output="${2}"
#			shift
#			;;
#		-h|--help)
#			help
#			exit 0
#			;;
#		-s|--style)
#			style="${2}"
#			shift
#			;;
#		-a|--args)
#			args="${2}"
#			shift
#			;;
#		*)
#			echo "Unknown parameter passed: ${1}"
#			exit 1
#			;;
#	esac
#	shift
#done
#
## checking args {{{
#if [ -z "${input}" ]; then
#	printf '%s\n\n' "No input is specified" 1>&2
#	help
#	exit 1
#fi
#
#if [ -z "${output}" ]; then
#	printf '%s\n\n' "No output is specified" 1>&2
#	help
#	exit 2
#fi
## }}}
## }}}
## launcher {{{
# vars and args {{{
#icon=""
#path="${HOME}/.local/hos/chars/emoji.txt"
#patched="-bw 0 -g 4 -l 10"
#style=""
#eargs=""
# }}}
#
#if [ "${style}" = 'tui' ]; then
#	runner="fzf -i -m \
#			--reverse \
#			--border=sharp \
#			--info=inline \
#			--prompt=: \
#			--marker=* \
#			--header=${prompt} --header-first \
#			${args} \
#			"
#elif [ -z ${DISPLAY} ]; then
#	runner="fzf -i -m \
#			--reverse \
#			--no-unicode \
#			--info=inline \
#			--border=sharp --border-label=${prompt} \
#			--prompt=: \
#			--marker=* \
#			${args} \
#			"
#elif [ "${style}" = 'gui' ]; then
#	runner="dmenu -l 9 -p ${prompt} ${patched} ${eargs}"
#else
#	runner="dmenu -l 9 -p ${prompt} ${patched} ${eargs}"
#fi
## }}}
## notification function {{{
#notify() {
#	summary="${1}"
#	if [ -z "${2}" ] || [ "${2}" = 1 ] || [ "${2}" = 2 ] || [ "${2}" = 3 ]; then
#		case ${2} in
#			1) mode=low ;;
#			2) mode=normal ;;
#			3) mode=critical ;;
#			*) mode=normal ;;
#		esac
#		#msgbody="${3}"
#	else
#		case ${3} in
#			1) mode=low ;;
#			2) mode=normal ;;
#			3) mode=critical ;;
#			*) mode=normal ;;
#		esac
#		msgbody="${2}"
#	fi
#
#	if [ ${mode} = 'critical' ]; then
#		iferror="stderr"
##		icon='error'
#	else
#		iferror="stdout"
#	fi
#
#	if [ -n "${icon}" ]; then
#		noticon="-i ${icon}"
#	fi
#
#	if [ "${style}" = 'tui' ]; then
#		printf '[%s] %s\n' "${summary}" "${msgbody}" "${iferror}"
#	elif [ -z "${DISPLAY}" ]; then
#		echo "${@}" >/dev/null 2>&1
#	else
#		notify-send -a "${prompt}" -u ${mode} ${noticon} \
#			"${summary}" "${msgbody}" 2>/dev/null
#		printf '[%s] %s\n' "${summary}" "${msgbody}" >/dev/${iferror}
#	fi
#}
## }}}

