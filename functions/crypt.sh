function direncrypt() {
    d="${1}"
    res="$(basename ${d}).tar.aes"
    echo "Encrypting ${d} to ${res}."
    
    if [[ ! -d "${d}" ]]; then
        echo "Error: ${d} is not a directory."
        return 1
    fi

    tarred_name="to_encrypt_tarball.tar"
    tar -cf "${tarred_name}" "${d}"
    if ! openssl enc -aes-256-cbc -pbkdf2 -iter 1000000 -in "${tarred_name}" -out "${res}"; then
        echo "ERROR: Failed to encrypt. Removing tarball, try again."
    fi
    rm "${tarred_name}"

    echo "Done."
}

function dirdecrypt() {
    aesfile="${1}"
    echo "Decrypting ${aesfile}."
    
    if [[ ! -f "${aesfile}" ]]; then
        echo "Error: ${aesfile} is not a directory."
        return 1
    fi

    tarred_name="unencrypted_tarball.tar"
    if ! openssl enc -d -aes-256-cbc -pbkdf2 -iter 1000000 -in "${aesfile}" -out "${tarred_name}"; then
        echo "ERROR: Failed to decrypt. Exiting."
        return 1
    fi
    echo "Decrypted. Untarring..."
    tar -xf "${tarred_name}"
    rm ${tarred_name}

    echo "Done."
}
