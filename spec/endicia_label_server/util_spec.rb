require 'spec_helper'

describe EndiciaLabelServer::Util do
  describe '.camelize' do
    subject { EndiciaLabelServer::Util.camelize('foo_bar_baz') }

    it 'should camelize the passed string' do
      expect(subject).to eql 'FooBarBaz'
    end
  end

  describe '.capitalize_with_id_exception' do
    context 'when passed the string id' do
      subject { EndiciaLabelServer::Util.capitalize_with_id_exception('id') }

      it 'should return ID' do
        expect(subject).to eql 'ID'
      end
    end

    context 'when passed anything else' do
      subject { EndiciaLabelServer::Util.capitalize_with_id_exception('blah') }

      it 'should return the capitalized string' do
        expect(subject).to eql 'Blah'
      end
    end
  end

  describe '.singularize' do
    context 'when passed a plural' do
      subject { EndiciaLabelServer::Util.singularize('words') }

      it 'should singularize the word' do
        expect(subject).to eql 'word'
      end
    end

    context 'when passed a singular' do
      subject { EndiciaLabelServer::Util.singularize('word') }

      it 'should not do anything' do
        expect(subject).to eql 'word'
      end
    end
  end
end
