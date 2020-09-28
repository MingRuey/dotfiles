#!/bin/bash

ask_yes_no() {
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) echo y; break;;
            No ) echo n; break;;
        esac
    done
}

configure_app_shortcut() {
    if [[ -z $1 ]] || [[ -z $2 ]]; then
        echo "usage: install_app appname loc"
        return 1
    fi

    echo "The .exe path of the app '$1':"
    read exe

    func1="$1 () {"
    func2="    exe=$exe"
    func3="    if [[ -z \$1 ]]; then"
    func4="        eval \$exe"
    func5="    else"
    func6="        eval \$exe \"\$(wslpath -m \$1)\""
    func7="    fi"
    func8="}"
    for line in "$func1" "$func2" "$func3" "$func4" "$func5" "$func6" "$func7" "$func8"; do
        echo $line >> $2
    done
    echo "" >> $2
}

interactive_install_collection_shortcut() {
    if [[ -z $@ ]]; then
        echo "usage: interactive_install_app collection-name app1 app2 app3 ..."
        return 1
    fi

    echo "Do you want to congifure shortcuts for App '$1'?"
    yn=$(ask_yes_no)
    outf="$(dirname $(readlink -f $0))/.apps"
    case $yn in
        y )
            for app in "${@:2}"; do
                configure_app_shortcut $app $outf
            done
            ;;
        n ) echo "Skip configuring '$1'";;
        * ) return 1;;
    esac
}

echo "---Configuring WSL application shortcuts---"
interactive_install_collection_shortcut Office winword winppt winexcel
interactive_install_collection_shortcut ImageJ imagej
