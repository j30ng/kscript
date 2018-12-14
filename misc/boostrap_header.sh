function _in_path() { command -v "$1" >/dev/null 2>&1; }
_in_path kscript && echo "kscript is already installed at $(which kscript)" 1>&2 || {
    function echo_and_eval() { echo "$ $@" 1>&2; eval "$@" 1>&2; }
    _in_path sdk || {
        curl "https://get.sdkman.io" | bash 1>&2 && \
            echo_and_eval source "$"SDKMAN_DIR/bin/sdkman-init.sh
    }
    _in_path kotlin || echo_and_eval sdk install kotlin
    _in_path gradle || echo_and_eval sdk install gradle
    echo_and_eval sdk install kscript
}