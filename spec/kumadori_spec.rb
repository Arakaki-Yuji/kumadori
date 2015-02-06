require 'spec_helper'

describe Kumadori do
  let(:custom_instance){ Custom.new }
  let(:not_defined){ NotDefined.new }

  it 'has a version number' do
    expect(Kumadori::VERSION).not_to be nil
  end

  describe 'Kumadori.decorate(obj) return obj' do
    let(:decorated){ Kumadori.decorate(custom_instance) }

    context 'if #{obj.class}Decorator class was defined' do
      it 'class name is #{obj.class}Decorator' do
        expect(decorated.class).to eq(CustomDecorator)
      end

      it 'respond to method that defined in #{obj.class}Decorator class' do
        expect(decorated.respond_to?(:custom_decorator_method)).to be true
      end
    end

    context 'if #{obj.class}Decorator class was not defined' do
      let(:not_defined_decorated) { Kumadori.decorate(not_defined) }

      it "class name is Kumadori::BaseDecorator" do
        expect(not_defined_decorated.class).to eq(Kumadori::BaseDecorator)
      end

      it 'not respond to method that defined in #{obj.class}Decorator class' do
        expect(not_defined_decorated.respond_to?(:custom_decorator_method)).to be false
      end

      it 'respond to method that defined in BaseDecorator class' do
        expect(not_defined_decorated.respond_to?(:base_decorator_method)).to be true
      end
    end


    it 'respond to method that defined in BaseDecorator class' do
      expect(decorated.respond_to?(:base_decorator_method)).to be true
    end

    it 'respond to method that defined in obj class' do
      expect(decorated.respond_to?(:custom_method)).to be true
    end

    describe 'if #{obj.class}Decorator defined same name method with obj.class' do
      it 'respond to method that defined in #{obj.class}Decorator class' do
        expect(decorated.same_name_method).to eq('Call from CustomDecorator class')
      end
    end

  end


  describe "Kumador.collection_decorate(objs) return objs" do

    let(:collection) do
      collection = []
      5.times do
        collection << Custom.new
      end
      5.times do
        collection << NotDefined.new
      end
      collection
    end

    it "all objs is BaseDecorator or Kumadori::BaseDecorator's child class" do
      decorated_collection = Kumadori.collection_decorate(collection)
      decorated_collection.each do |obj|
        expect(obj.is_a?(Kumadori::BaseDecorator)).to be true
      end
    end
  end
end
