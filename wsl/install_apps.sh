#!/bin/bash

OUTF="$(dirname $(readlink -f $0))/.apps"

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

    echo "$1 () {" >> $2
    echo "    exe=\$(printf '%q' \"$exe\")" >> $2
    echo "    if [[ -z \$1 ]]; then" >> $2
    echo "        eval \$exe" >> $2
    echo "    else" >> $2
    echo "        eval \$exe '\$(wslpath -w \$1)'" >> $2
    echo "    fi" >> $2
    echo "}" >> $2
    echo "" >> $2
}

interactive_install_collection_shortcut() {
    if [[ -z $@ ]]; then
        echo "usage: interactive_install_app collection-name app1 app2 app3 ..."
        return 1
    fi

    echo "Do you want to configure shortcuts for App '$1'?"
    yn=$(ask_yes_no)
    case $yn in
        y )
            for app in "${@:2}"; do
                configure_app_shortcut $app $OUTF
            done
            ;;
        n ) echo "Skip configuring '$1'";;
        * ) return 1;;
    esac
}

interactive_configure_imagej() {
    echo "Do you want to configure ImageJ?"
    yn=$(ask_yes_no)
    case $yn in
        y )
            echo "Directory where ImageJ.exe locates:"
            read path
            echo "imagej () {" >> $OUTF
            echo "    current=\$(realpath .)" >> $OUTF
            echo "    if [[ -z \$1 ]]; then" >> $OUTF
            echo "        cd $path" >> $OUTF
            echo "        ./ImageJ.exe" >> $OUTF
            echo "    else" >> $OUTF
            echo "        file=\$(wslpath -m \$1)" >> $OUTF
            echo "        cd $path" >> $OUTF
            echo "        ./ImageJ.exe \$file" >> $OUTF
            echo "    fi" >> $OUTF
            echo "    cd \$current" >> $OUTF
            echo "}" >> $OUTF
            echo "" >> $OUTF
            ;;
        n ) echo "Skip configuring ImageJ";;
        * ) return 1;;
    esac
}


echo "---Configuring WSL application shortcuts---"

if [ -f $OUTF ]; then
    echo "dotfiles/wsl/.apps exists, remove it?"
    yn=$(ask_yes_no)
    case $yn in
        y)
            rm $OUTF
            ;;
        n)
            echo "Skip shortcut settings, use existing .app configuration"
            exit 0;;
        *)  exit 1;; 
    esac
fi

echo "#!/bin/bash" >> $OUTF
interactive_install_collection_shortcut Chrome chrome
interactive_install_collection_shortcut Edge edge
interactive_install_collection_shortcut Office winword winppt winexcel
interactive_install_collection_shortcut IrfanView irfan
interactive_configure_imagej
