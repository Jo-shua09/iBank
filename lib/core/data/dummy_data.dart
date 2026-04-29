class InterestRate {
  final String kind;
  final String deposit;
  final String rate;

  InterestRate({required this.kind, required this.deposit, required this.rate});
}

// Rates
final List<InterestRate> rates = [
  InterestRate(kind: 'Individual customers', deposit: '1m', rate: "4.50%"),
  InterestRate(kind: 'Corporate customers', deposit: '2m', rate: "5.50%"),
  InterestRate(kind: 'Savings Account', deposit: '500k', rate: "3.20%"),
  InterestRate(kind: 'Fixed Deposit', deposit: '5m', rate: "6.75%"),
  InterestRate(kind: 'Student Account', deposit: '100k', rate: "2.50%"),
  InterestRate(kind: 'Senior Citizens', deposit: '1m', rate: "5.00%"),
  InterestRate(kind: 'Business Premium', deposit: '10m', rate: "7.20%"),
  InterestRate(kind: 'Wealth Management', deposit: '50m', rate: "8.50%"),
  InterestRate(kind: 'Micro Savings', deposit: '10k', rate: "1.50%"),
  InterestRate(kind: 'Gold Deposit', deposit: '20m', rate: "6.00%"),
  InterestRate(kind: 'Pension Fund', deposit: '5m', rate: "5.80%"),
  InterestRate(kind: 'Education Fund', deposit: '2m', rate: "4.20%"),
  InterestRate(kind: 'Holiday Savings', deposit: '300k', rate: "3.00%"),
];

class ExchangeRate {
  final String country;
  final String countryCode;
  final String buy;
  final String sell;

  ExchangeRate({
    required this.country,
    required this.countryCode,
    required this.buy,
    required this.sell,
  });
}

final List<ExchangeRate> exchangeRates = [
  ExchangeRate(
    country: 'USA (USD)',
    countryCode: 'US',
    buy: '24,500',
    sell: '25,100',
  ),
  ExchangeRate(
    country: 'Europe (EUR)',
    countryCode: 'EU',
    buy: '26,200',
    sell: '27,050',
  ),
  ExchangeRate(
    country: 'UK (GBP)',
    countryCode: 'GB',
    buy: '31,100',
    sell: '32,400',
  ),
  ExchangeRate(
    country: 'Japan (JPY)',
    countryCode: 'JP',
    buy: '165',
    sell: '172',
  ),
  ExchangeRate(
    country: 'Australia (AUD)',
    countryCode: 'AU',
    buy: '16,100',
    sell: '16,800',
  ),
  ExchangeRate(
    country: 'Canada (CAD)',
    countryCode: 'CA',
    buy: '18,200',
    sell: '18,950',
  ),
  ExchangeRate(
    country: 'Singapore (SGD)',
    countryCode: 'SG',
    buy: '18,400',
    sell: '19,100',
  ),
  ExchangeRate(
    country: 'China (CNY)',
    countryCode: 'CN',
    buy: '3,450',
    sell: '3,600',
  ),
  ExchangeRate(
    country: 'Switzerland (CHF)',
    countryCode: 'CH',
    buy: '27,800',
    sell: '28,600',
  ),
  ExchangeRate(
    country: 'Hong Kong (HKD)',
    countryCode: 'HK',
    buy: '3,150',
    sell: '3,300',
  ),
  ExchangeRate(
    country: 'Thailand (THB)',
    countryCode: 'TH',
    buy: '680',
    sell: '720',
  ),
  ExchangeRate(
    country: 'Korea (KRW)',
    countryCode: 'KR',
    buy: '18.5',
    sell: '20.2',
  ),
];
