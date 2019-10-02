#!/usr/bin/env bash

BASEDIR=$(dirname `readlink -f "$0"`)

NOINSTALL=`find . -mindepth 1 -maxdepth 1 -type d '!' \
            -exec test -e "{}/install.sh" ';' -print | \
            awk -F '/' '{print $2}' | \
            uniq | sort | grep -v ".git"`

install () {
    for INSTALLDIR in $(ls -d *):
    do
        if [[ ${INSTALLDIR} = "yay" ]]
        then
            echo -e "\nSkipping yay..\n"
            break
        else
            INSTALLDIR="${BASEDIR}/${INSTALLDIR}"
            if [[ -d ${INSTALLDIR} ]]
            then
                if [[ -e ${INSTALLDIR}/install.sh ]]
                then
                    ${INSTALLDIR}/install.sh
                    # echo -e "Installing ${INSTALLDIR}"
                fi
            fi
        fi
    done
}

check_folder () {
    echo -e "==== st, slock and xdg should be done manually ====\n"
    echo -e "Those folders doesn't have an install script:"
    for FOLDER in ${NOINSTALL}
    do
        echo "- ${FOLDER}"
    done
    echo -e "You may want to check them individually"
}

${BASEDIR}/yay/install.sh
install
check_folder
