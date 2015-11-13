createMockConstant = () ->
    JSON_TYPE = 'text/json;charset=utf-8'
    TEXT_TYPE = 'text;charset=utf-8'

    toArray = (arrLike) ->
        Array.prototype.slice.call arrLike

    getFileName = (s) ->
        s.replace(/[^a-z0-9]/gi, '_').toLowerCase() + '.json'

    outputSaved = (id, isMocked, assetLoc, isSilet) ->
        [msg, color] = if isMocked is true then ["Mocked", "green"] else ["Not mocked", "red"]
        console.log "%c#{msg} #{id}: #{assetLoc}stub/#{id}", "color: #{color};" if not isSilet

    download = (type=JSON_TYPE, data, id, stringify=true) ->
        fileName = getFileName id
        data = JSON.stringify data unless not stringify
        blob = new Blob [data], {type}
        URL = window.URL or window.webkitURL
        downloadUrl = URL.createObjectURL blob
        a = document.createElement 'a'
        a.href = downloadUrl
        a.download = fileName
        document.body.appendChild a
        a.click()

    {
        JSON_TYPE
        TEXT_TYPE
        toArray
        getFileName
        outputSaved
        download
    }

angular
    .module 'ng-mock-request'
    .constant 'mockRequestConstant', createMockConstant()