require_relative "./translate.rb"

# TODO:
# *** Melhorar interatividade de checagem dos inputs enviados
# ou seja, mostrar erros nos inputs errado junto com help para dica
# -> check_inputs
# 
# ** Adicionar helps
# 

module Translate
  class Cli
    def initialize(input)
      @input = input
      @data = {msg: "", lang_msg: "", lang_translate: ""}
      # @data_position = {msg: 0, lang_msg: 0, lang_translate: 0}
      @key_to_translate = false

      @rgx_msg = /^[a-zA-Z]+/
      @rgx_flag = /^-{2}[a-zA-Z]+/
    end

    def start_translate
      @key_to_translate = check_inputs
      Translate::Translete.start(@data[:msg], @data[:lang_msg], @data[:lang_translate]) if @key_to_translate == true
    end

    private

    def check_inputs
      flags_index = []
      msg_index = 0
      for i in 0..@input.length do
        flags_index << i if @input[i] =~ @rgx_flag
        msg_index = i if @input[i] =~ @rgx_msg
      end
      
      set_data_inputs(flags_index, msg_index)
      true
    end
    
    def set_data_inputs(flags_index, msg_index)
      @data[:lang_msg]        = @input[flags_index[0]]
      @data[:lang_translate]  = @input[flags_index[1]]
      @data[:msg]             = @input[msg_index]
    end
  end
end

# cli = CLI::Cli.new(ARGV)
# cli.stats_argv
