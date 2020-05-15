# LIQUID PROMPT PS1 TEMPLATE: xtreme-liquid
#
# Dynamic vars:
#
# LP_BATT       battery percent
# LP_LOAD       load percent
# LP_JOBS       screen sessions / running jobs / suspended jobs
# LP_USER       user
# LP_HOST       hostname
# LP_PERM       colon (":") color indicates write permission
# LP_PWD        current working directory
# LP_VENV       Python virtual env
# LP_PROXY      HTTP proxy
# LP_VCS        version control repository
# LP_RUBY_VENV  Ruby virtual env
# LP_ERR        last status/error return code
# LP_TIME       clock time
# LP_TTYN       teletype number (useful in title for quick switching)
# LP_RUNTIME    execution time of last command
#
# Static vars (from theme):
#
# LP_BRACKET_OPEN   open bracket
# LP_BRACKET_CLOSE  close bracket
# LP_MARK           prompt mark
# LP_MARK_PREFIX    user-defined prompt mark prefix (can create 2-line prompts)
# LP_PS1_PREFIX     user-defined general-purpose prefix (default: set title)
# LP_PS1_POSTFIX    user-defined general-purpose postfix


# System Status: clock, jobs, load, battery
LP_PS1="${LP_PS1_PREFIX}${LP_TIME}${LP_BATT}${LP_LOAD}${LP_JOBS}"

# Login Details: username, hostname, colon
LP_PS1="${LP_PS1}${LP_USER}${LP_HOST}${LP_PERM}"

# Working Space: working dir, virual env, proxy
LP_PS1="${LP_PS1}${LP_BRACKET_OPEN}${LP_PWD}${LP_BRACKET_CLOSE}${LP_VENV}${LP_RUBY_VENV}${LP_PROXY}"

# VCS Notifiers: (displayed for root user only if LP_ENABLE_VCS_ROOT)
LP_PS1="${LP_PS1}${LP_VCS}"

# Prompt String: run time, return status, prompt mark
LP_PS1="${LP_PS1}${LP_RUNTIME}${LP_ERR}${LP_MARK_PREFIX}${LP_MARK}${LP_PS1_POSTFIX}"

# Set Window Title to WSL_DISTRO_NAME or use current prompt as default
LP_TITLE="$(_lp_title "${WSL_DISTRO_NAME:-$LP_PS1}")"
# Window Title: embed OSC ctrl. sequence 'Set Text Parameters' (non-print chars)
LP_PS1="${LP_TITLE}${LP_PS1}"

# Set Cursor Style to the string returned by setCursorStyle function
LP_CURSOR="${_LP_OPEN_ESC}$(_lp_setCursorStyle)${_LP_CLOSE_ESC}"
# Cursor Style: embed OSC ctrl. sequence 'Set Cursor Style' (non-print chars)
LP_PS1="${LP_PS1}${LP_CURSOR}"

