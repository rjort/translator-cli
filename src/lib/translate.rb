require 'rest-client'
require 'json'

module Translate
  class Translate
    # a key da api nao tava sendo gerada ou sei la...
    # TODO:
    # mudar para outra api de translate
    @@api_key = ""
    @@url = "https://translate.api.cloud.yandex.net/translate/v2/languages"

    def start(msg, lang_msg, lang_translate)
      set_response(msg, lang_translate)
    end

    pritave

    def get_translate
      JSON.parse(@res)[:text]
    end

    def set_response(msg, lang_translate)
      @res = RestClient.get(@@url, params: {
        key: @@api_key,
        text: msg,
        lang: lang_translate
      })
    end
  end
end
