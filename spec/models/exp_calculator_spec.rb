require 'rails_helper'

RSpec.describe ExpCalculator, type: :model do
  let(:exp) { 1_000 }
  describe '.party_exp' do
    context 'with only one vocation' do
      let(:diff_vocations) { 1 }
      it 'returns full exp if party-of-one' do
        result = ExpCalculator.new(exp, diff_vocations, 1).party_exp
        expect(result).to eql 1_000
      end
      it 'returns full exp/party size if more than one member' do
        result = ExpCalculator.new(exp, diff_vocations, 4).party_exp
        expect(result).to eql 250
      end
    end
    context 'with two different vocation' do
      let(:diff_vocations) { 2 }
      it 'returns 0 if party-of-one' do
        result = ExpCalculator.new(exp, diff_vocations, 1).party_exp
        expect(result).to eql 0
      end
      it 'returns full exp * 1.3/2 if party-of-two' do
        result = ExpCalculator.new(exp, diff_vocations, 2).party_exp
        expect(result).to eql 650
      end
      it 'returns full exp * 1.3/x if x members' do
        result = ExpCalculator.new(exp, diff_vocations, 4).party_exp
        expect(result).to eql 325
      end
    end
    context 'with three different vocation' do
      let(:diff_vocations) { 3 }
      it 'returns 0 if party-of-one' do
        result = ExpCalculator.new(exp, diff_vocations, 1).party_exp
        expect(result).to eql 0
      end
      it 'returns 0 if party-of-two' do
        result = ExpCalculator.new(exp, diff_vocations, 2).party_exp
        expect(result).to eql 0
      end
      it 'returns full exp * 1.6/3 if party-of-three' do
        result = ExpCalculator.new(exp, diff_vocations, 3).party_exp
        expect(result).to eql 533
      end
      it 'returns full exp * 1.6/x if x members' do
        result = ExpCalculator.new(exp, diff_vocations, 4).party_exp
        expect(result).to eql 400
      end
    end
    context 'with four different vocation' do
      let(:diff_vocations) { 4 }
      it 'returns 0 if party-of-one' do
        result = ExpCalculator.new(exp, diff_vocations, 1).party_exp
        expect(result).to eql 0
      end
      it 'returns 0 if party-of-two' do
        result = ExpCalculator.new(exp, diff_vocations, 2).party_exp
        expect(result).to eql 0
      end
      it 'returns 0 if party-of-three' do
        result = ExpCalculator.new(exp, diff_vocations, 3).party_exp
        expect(result).to eql 0
      end
      it 'returns full exp * 2/4 if party-of-four' do
        result = ExpCalculator.new(exp, diff_vocations, 4).party_exp
        expect(result).to eql 500
      end
      it 'returns full exp * 2/x if x members' do
        result = ExpCalculator.new(exp, diff_vocations, 6).party_exp
        expect(result).to eql 333
      end
    end
  end
end