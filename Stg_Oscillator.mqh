/**
 * @file
 * Implements Oscillator strategy based on the Oscillator indicator.
 */

// User input params.
INPUT_GROUP("Oscillator strategy: strategy params");
INPUT float Oscillator_LotSize = 0;                // Lot size
INPUT int Oscillator_SignalOpenMethod = 0;         // Signal open method
INPUT float Oscillator_SignalOpenLevel = 0;        // Signal open level
INPUT int Oscillator_SignalOpenFilterMethod = 32;  // Signal open filter method
INPUT int Oscillator_SignalOpenFilterTime = 3;     // Signal open filter time (0-31)
INPUT int Oscillator_SignalOpenBoostMethod = 0;    // Signal open boost method
INPUT int Oscillator_SignalCloseMethod = 0;        // Signal close method
INPUT int Oscillator_SignalCloseFilter = 32;       // Signal close filter (-127-127)
INPUT float Oscillator_SignalCloseLevel = 0;       // Signal close level
INPUT int Oscillator_PriceStopMethod = 0;          // Price limit method
INPUT float Oscillator_PriceStopLevel = 2;         // Price limit level
INPUT int Oscillator_TickFilterMethod = 32;        // Tick filter method (0-255)
INPUT float Oscillator_MaxSpread = 4.0;            // Max spread to trade (in pips)
INPUT short Oscillator_Shift = 0;                  // Shift
INPUT float Oscillator_OrderCloseLoss = 80;        // Order close loss
INPUT float Oscillator_OrderCloseProfit = 80;      // Order close profit
INPUT int Oscillator_OrderCloseTime = -30;         // Order close time in mins (>0) or bars (<0)
INPUT_GROUP("Oscillator strategy: Oscillator indicator params");
INPUT int Oscillator_Indi_Oscillator_Shift = 0;                                        // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_Oscillator_SourceType = IDATA_INDICATOR;  // Source type

// Structs.

// Defines struct with default user strategy values.
struct Stg_Oscillator_Params_Defaults : StgParams {
  Stg_Oscillator_Params_Defaults()
      : StgParams(::Oscillator_SignalOpenMethod, ::Oscillator_SignalOpenFilterMethod, ::Oscillator_SignalOpenLevel,
                  ::Oscillator_SignalOpenBoostMethod, ::Oscillator_SignalCloseMethod, ::Oscillator_SignalCloseFilter,
                  ::Oscillator_SignalCloseLevel, ::Oscillator_PriceStopMethod, ::Oscillator_PriceStopLevel,
                  ::Oscillator_TickFilterMethod, ::Oscillator_MaxSpread, ::Oscillator_Shift) {
    Set(STRAT_PARAM_LS, Oscillator_LotSize);
    Set(STRAT_PARAM_OCL, Oscillator_OrderCloseLoss);
    Set(STRAT_PARAM_OCP, Oscillator_OrderCloseProfit);
    Set(STRAT_PARAM_OCT, Oscillator_OrderCloseTime);
    Set(STRAT_PARAM_SOFT, Oscillator_SignalOpenFilterTime);
  }
};

class Stg_Oscillator : public Strategy {
 public:
  Stg_Oscillator(StgParams &_sparams, TradeParams &_tparams, ChartParams &_cparams, string _name = "")
      : Strategy(_sparams, _tparams, _cparams, _name) {}

  static Stg_Oscillator *Init(ENUM_TIMEFRAMES _tf = NULL, EA *_ea = NULL) {
    // Initialize strategy initial values.
    Stg_Oscillator_Params_Defaults stg_oscillator_defaults;
    StgParams _stg_params(stg_oscillator_defaults);
    // Initialize Strategy instance.
    ChartParams _cparams(_tf, _Symbol);
    TradeParams _tparams;
    Strategy *_strat = new Stg_Oscillator(_stg_params, _tparams, _cparams, "Oscillator");
    return _strat;
  }

  /**
   * Event on strategy's init.
   */
  void OnInit() {
    // Initialize indicators.
    /*
    IndiOscillatorParams _indi_params(::Oscillator_Indi_Oscillator_Shift);
    _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
    SetIndicator(new Indi_Oscillator(_indi_params));
    */
  }

  /**
   * Check strategy's opening signal.
   */
  bool SignalOpen(ENUM_ORDER_TYPE _cmd, int _method, float _level = 0.0f, int _shift = 0) {
    // Indi_Oscillator *_indi = GetIndicator();
    bool _result =
        _indi.GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) && _indi.GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
    if (!_result) {
      // Returns false when indicator data is not valid.
      return false;
    }
    /*
    IndicatorSignal _signals = _indi.GetSignals(4, _shift);
    switch (_cmd) {
      case ORDER_TYPE_BUY:
        // Buy signal.
        _result &= _indi.IsIncreasing(1, 0, _shift);
        _result &= _indi.IsIncByPct(_level / 10, 0, _shift, 2);
        _result &= _method > 0 ? _signals.CheckSignals(_method) : _signals.CheckSignalsAll(-_method);
        break;
      case ORDER_TYPE_SELL:
        // Sell signal.
        _result &= _indi.IsDecreasing(1, 0, _shift);
        _result &= _indi.IsDecByPct(_level / 10, 0, _shift, 2);
        _result &= _method > 0 ? _signals.CheckSignals(_method) : _signals.CheckSignalsAll(-_method);
        break;
    }
    */
    return _result;
  }
};
