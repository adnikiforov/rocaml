
# extension name, XXX in   require 'XXX'
EXT_NAME = "oo"

# if non-empty, will use ocamlfind
OCAML_PACKAGES = %w[]

# cmxa
CAML_LIBS = %[]

# list of .cmx
CAML_OBJS = %w[oo.cmx]

# a .o file that will contain your code and the runtime
CAML_TARGET = %w[oo_wrapper.o]

# compilation flags
CAML_FLAGS = ""

# -I options (-I must be prepended)
CAML_INCLUDES = %w[]

$:.unshift "../.."

require 'ruby_ocaml'

Interface.generate("oo", :dest => "oo_wrap.c") do
  def_class("Oo") do |c|
    fun "new_from_string", STRING => c.abstract_type
    fun "new", INT => c.abstract_type
    method "inc", c.abstract_type => UNIT
    method "get", c.abstract_type => INT
  end
end

require 'ruby_ocaml_extconf'
