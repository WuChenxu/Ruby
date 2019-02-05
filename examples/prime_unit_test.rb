require 'test/unit'
require_relative 'prime'
class PrimeTest < Test::Unit::TestCase
    def test_case_Normal
        assert_equal(false, 1.prime?)
        assert_equal(true, 2.prime?)
        assert_equal(true, 3.prime?)
        assert_equal(false, 4.prime?)
        assert_equal(true, 5.prime?)
        assert_equal(false, 6.prime?)
        assert_equal(true, 7.prime?)
        assert_equal(false, 8.prime?)
        assert_equal(false, 9.prime?)
        assert_equal(false, 10.prime?)
        # Mersenne prime
        assert_equal(true, (2**7-1).prime?)
        assert_equal(true, (2**13-1).prime?)
        assert_equal(true, (2**17-1).prime?)
        #assert_equal(true, (2**67-1).prime?)
    end

    def test_case_abnormal
        assert_raise(NoMethodError){ "1".prime? }
    end
    
end