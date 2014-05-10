class MoneyCalculator
    attr_accessor :total_c, :total
    def initialize(ones, fives, tens, twenties, fifties, hundreds, five_hundreds, thousands)
    # each parameter represents the quantity per denomination of money
    # these parameters can be assigned to instance variables and used for computation

    # add a method called 'change' that takes in a parameter of how much an item costs
    # and returns a hash of how much change is to be given
    # the hash will use the denominations as keys and the amount per denomination as values
    # i.e. {:fives => 1, fifties => 1, :hundreds => 3}
    @ones = ones.to_i * 1
    @fives = fives.to_i * 5
    @tens = tens.to_i * 10
    @twenties = twenties.to_i * 20
    @fifties = fifties.to_i * 50
    @hundreds = hundreds.to_i * 100
    @five_hundreds = five_hundreds.to_i * 500
    @thousands = thousands.to_i * 1000

    @total = @ones + @fives + @tens + @twenties + @fifties + @hundreds + @five_hundreds + @thousands
end
def change(cost, quantity)
    @total_change = @total - (cost.to_i * quantity.to_i)
    @total_c = @total_change
    if @total_change > 1000
        change_thousands = @total_change / 1000
        @total_change = @total_change % 1000
    end

    if @total_change > 500
        change_fivehundreds = @total_change / 500
        @total_change = @total_change % 500
    end

    if @total_change > 100
        change_hundreds = @total_change / 100
        @total_change = @total_change % 100
    end

    if @total_change > 50
        change_fifties = @total_change / 50
        @total_change = @total_change % 50
    end

    if @total_change > 20
        change_twenties = @total_change / 20
        @total_change = @total_change % 20
    end

    if @total_change > 10
        change_tens = @total_change / 10
        @total_change = @total_change % 10
    end

    if @total_change > 5
        change_fives = @total_change / 5
        @total_change = @total_change % 5
    end

    if @total_change > 1
        change_ones = @total_change / 1
        @total_change = @total_change % 1
    end

    change = {
        :ones => change_ones.to_i,
        :fives => change_fives.to_i,
        :tens => change_tens.to_i,
        :twenties => change_twenties.to_i,
        :fifties => change_fifties.to_i, 
        :hundreds => change_hundreds.to_i,
        :five_hundreds => change_fivehundreds.to_i,
        :thousands => change_thousands.to_i
    }
    return change
  end
end