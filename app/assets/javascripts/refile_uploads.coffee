class RefilePreviewImage
  constructor: (@$el) ->
    defaults = processor: "fill", width: "100", height: "100", filename: "preview"

    @options = $.extend defaults, @$el.data("refile-preview")
    @input = $("#" + @options.input)

    @_bindEvents()

  _bindEvents: ->
    $(document).on 'upload:preview', 'form', =>
      @_loadImage()

  _loadImage: ->
    src = ["/attachments", "cache", @options.processor, @options.width, @options.height, @input.data("id"), @options.filename].join("/")
    @$el.attr("src", src)

new RefilePreviewImage($("[data-refile-preview]"))

class RefileUploads
  constructor: ->
    @_bindEvents()

  _bindEvents: ->
    $(document).on 'upload:start', 'form', @_disbleForm
    $(document).on 'upload:complete', 'form', @_enableForm
    $(document).on 'upload:success', 'form', @_triggerPreview

  _disbleForm: ->
    $(this).find('input[type=submit]').attr 'disabled', true

  _enableForm: ->
    unless $(this).find('input.uploading').length
      $(this).find('input[type=submit]').removeAttr 'disabled'

  _triggerPreview: (e) ->
    $("form").trigger("upload:preview")


new RefileUploads()
