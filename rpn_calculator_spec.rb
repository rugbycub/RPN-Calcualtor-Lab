require 'rspec'
require './rpn_calculator.rb'
require 'pry'

describe RPNCalculator do
  it 'should parse a rpn string into a list' do
    rpn_string = "4 5 8 + * 11 /"
    rpn_list = RPNCalculator.parse(rpn_string)
    expect(rpn_list).to respond_to(:[]).with(1).argument
    
    expect(rpn_list[0]).to eq('4')
    expect(rpn_list[1]).to eq('5')
    expect(rpn_list[2]).to eq('8')
    expect(rpn_list[3]).to eq('+')
    expect(rpn_list[4]).to eq('*')
    expect(rpn_list[5]).to eq('11')
    expect(rpn_list[6]).to eq('/')
  end
  
  it 'should be able to identify a number' do
    expect(RPNCalcualtor.is_number('5')).to be_true
    expect(RPNCalcualtor.is_number('-995')).to be_true
    expect(RPNCalcualtor.is_number('X')).to be_false
    expect(RPNCalcualtor.is_number('+')).to be_false
  end

  it 'should be able to identify an operator' do
    expect(RPNCalcualtor.is_number('+')).to be_true
    expect(RPNCalcualtor.is_number('-')).to be_true
    expect(RPNCalcualtor.is_number('*')).to be_true
    expect(RPNCalcualtor.is_number('/')).to be_true
    expect(RPNCalcualtor.is_number('^')).to be_true
    expect(RPNCalcualtor.is_number('=')).to be_false
    expect(RPNCalcualtor.is_number('2')).to be_false
  end

  it 'should evaluate the rpn expression' do
    rpn_string = "5 8 -"
    rpn_list = RPNCalculator.parse(rpn_string)

    expect(RPNCalcualtor.evaluate(rpn_list)).to eq(-3)

    rpn_string = "5 2 /"
    rpn_list = RPNCalculator.parse(rpn_string)

    expect(RPNCalcualtor.evaluate(rpn_list)).to eq(2.5)

    rpn_string = "4 5 8 + * 2 /"
    rpn_list = RPNCalculator.parse(rpn_string)

    expect(RPNCalcualtor.evaluate(rpn_list)).to eq(26)
  end
end
