import nimcrypto

proc hashData(data: string): string = 
    return toHex(sha256.digest(data).data, lowercase=true)




when isMainModule:
    let data: string = "This is a string"

    echo hashData(data)