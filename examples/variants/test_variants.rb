
module Variants; end # namespace
require 'variants'

class Variant
  module Ext
    KINDS = %w[Foo Bar Baz].map{|x| x.to_sym}

    def kind
      puts "get_kind returns #{super}"
      KINDS[super]
    end

    def kind=(x)
      tag = KINDS.index(x)
      raise "Unknown tag #{x}" unless tag
      puts "Setting tag #{x} -> #{tag}"
      super tag
    end
  end

  def self.new
    r = Variants::DummyBase.new
    r.extend Ext
    r
  end
end

o = Variant.new
p o
p o.kind
o.kind = :Bar
p o.kind