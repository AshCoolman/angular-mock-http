MockHttpService = ($http, MockHttpConstant) ->

    # { getFileName, outputSaved, toArray } = MockHttpConstant
    # { isOn, getStubFiles, isDownload } = api

    # isToMock = (id) =>
    #     @isOn and _.contains getStubFiles(), id

    # tryMock = (isMock, args, id, config) =>
    #     filename = getFileName id
    #     outputSaved filename, isMock
        
    #     return if $http
    #             method          : 'GET'
    #             url             : getAssetLoc()+'stub/' + filename
    #             withCredentials : false
    #             headers         : []
    #     else
    #         return $http config 


    # # PUBLIC
    # save = (data, id) => 
    #     if isDownload() then dl null, data,  id

    # get = (args, id, config) =>
    #     tryMock isToMock(), toArray(args), id, config

    # INTERFACE
    {
        # get
        # save
        test: () -> console.log 'yes I work'
    }

MockHttpProvider = (config, MockHttpConstant) ->
    @api = 
        isOn: () ->
            false
        getStubFiles: () ->
            []
        isDownload: () ->
            false
    @$get = () ->
        new MockHttpService()

    @


MockHttp = ($http, config) ->
    { isOn, isSilent, isDownload } = config

angular
    .module 'ng-mock-http'
    .provider 'MockHttp', MockHttpProvider