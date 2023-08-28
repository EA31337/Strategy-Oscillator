/**
 * @file
 * Implements Oscillator strategy based on the Oscillator indicator.
 */

enum ENUM_STG_OSCILLATOR_TYPE {
  STG_OSCILLATOR_TYPE_0_NONE = 0,  // (None)
  STG_OSCILLATOR_TYPE_AC,          // AC
  STG_OSCILLATOR_TYPE_AD,          // AD
  STG_OSCILLATOR_TYPE_AO,          // Awesome
  STG_OSCILLATOR_TYPE_ATR,         // ATR
  STG_OSCILLATOR_TYPE_BEARS,       // Bears Power
  STG_OSCILLATOR_TYPE_BULLS,       // Bulls Power
  STG_OSCILLATOR_TYPE_BWMFI,       // BWMFI
  STG_OSCILLATOR_TYPE_CCI,         // CCI
  STG_OSCILLATOR_TYPE_CHO,         // Chaikin
  STG_OSCILLATOR_TYPE_CHV,         // Chaikin Volatility
  STG_OSCILLATOR_TYPE_DEMARKER,    // DeMarker
  STG_OSCILLATOR_TYPE_MFI,         // MFI
  STG_OSCILLATOR_TYPE_RSI,         // RSI
  STG_OSCILLATOR_TYPE_STOCH,       // Stochastic
  STG_OSCILLATOR_TYPE_WPR,         // WPR
};

// User input params.
INPUT_GROUP("Oscillator strategy: main strategy params");
INPUT ENUM_STG_OSCILLATOR_TYPE Oscillator_Type = STG_OSCILLATOR_TYPE_CCI;  // Oscillator type
INPUT_GROUP("Oscillator strategy: strategy params");
INPUT float Oscillator_LotSize = 0;                // Lot size
INPUT int Oscillator_SignalOpenMethod = 6;         // Signal open method
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
INPUT_GROUP("Oscillator strategy: AC oscillator params");
INPUT int Oscillator_Indi_AC_Shift = 0;                                      // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_AC_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: AD oscillator params");
INPUT int Oscillator_Indi_AD_Shift = 0;                                      // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_AD_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: ATR oscillator params");
INPUT int Oscillator_Indi_ATR_Period = 13;  // Period
INPUT int Oscillator_Indi_ATR_Shift = 0;    // Shift
INPUT_GROUP("Oscillator strategy: Awesome oscillator params");
INPUT int Oscillator_Indi_Awesome_Shift = 0;  // Shift
INPUT_GROUP("Oscillator strategy: BearsPower oscillator params");
INPUT int Oscillator_Indi_BearsPower_Period = 30;                                 // Period
INPUT ENUM_APPLIED_PRICE Oscillator_Indi_BearsPower_Applied_Price = PRICE_CLOSE;  // Applied Price
INPUT int Oscillator_Indi_BearsPower_Shift = 0;                                   // Shift
INPUT_GROUP("Oscillator strategy: BullsPower oscillator params");
INPUT int Oscillator_Indi_BullsPower_Period = 30;                                 // Period
INPUT ENUM_APPLIED_PRICE Oscillator_Indi_BullsPower_Applied_Price = PRICE_CLOSE;  // Applied Price
INPUT int Oscillator_Indi_BullsPower_Shift = 0;                                   // Shift
INPUT_GROUP("Oscillator strategy: BWMFI oscillator params");
INPUT int Oscillator_Indi_BWMFI_Shift = 1;                                      // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_BWMFI_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: CCI oscillator params");
INPUT int Oscillator_Indi_CCI_Period = 20;                                   // Period
INPUT ENUM_APPLIED_PRICE Oscillator_Indi_CCI_Applied_Price = PRICE_TYPICAL;  // Applied Price
INPUT int Oscillator_Indi_CCI_Shift = 0;                                     // Shift
INPUT_GROUP("Oscillator strategy: Chaikin oscillator params");
INPUT int Oscillator_Indi_CHO_InpFastMA = 10;                                 // Fast EMA period
INPUT int Oscillator_Indi_CHO_InpSlowMA = 30;                                 // Slow MA period
INPUT ENUM_MA_METHOD Oscillator_Indi_CHO_InpSmoothMethod = MODE_SMMA;         // MA method
INPUT ENUM_APPLIED_VOLUME Oscillator_Indi_CHO_InpVolumeType = VOLUME_TICK;    // Volumes
INPUT int Oscillator_Indi_CHO_Shift = 0;                                      // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_CHO_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: Chaikin Volatility oscillator params");
INPUT unsigned int Oscillator_Indi_CHV_Smooth_Period;                         // Smooth period
INPUT unsigned int Oscillator_Indi_CHV_Period;                                // Period
INPUT ENUM_CHV_SMOOTH_METHOD Oscillator_Indi_CHV_Smooth_Method;               // Smooth method
INPUT int Oscillator_Indi_CHV_Shift = 0;                                      // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_CHV_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("Oscillator strategy: DeMarker indicator params");
INPUT int Oscillator_Indi_DeMarker_Period = 23;                                    // Period
INPUT int Oscillator_Indi_DeMarker_Shift = 0;                                      // Shift
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_DeMarker_SourceType = IDATA_BUILTIN;  // Source type
INPUT_GROUP("MFI strategy: MFI indicator params");
INPUT int MFI_Indi_MFI_MA_Period = 22;                                           // MA Period
INPUT ENUM_APPLIED_VOLUME MFI_Indi_MFI_Applied_Volume = (ENUM_APPLIED_VOLUME)0;  // Applied volume.
INPUT int MFI_Indi_MFI_Shift = 0;                                                // Shift
INPUT_GROUP("Oscillator strategy: RSI oscillator params");
INPUT int Oscillator_Indi_RSI_Period = 16;                                    // Period
INPUT ENUM_IDATA_SOURCE_TYPE Oscillator_Indi_MFI_SourceType = IDATA_BUILTIN;  // Source type
INPUT ENUM_APPLIED_PRICE Oscillator_Indi_RSI_Applied_Price = PRICE_WEIGHTED;  // Applied Price
INPUT int Oscillator_Indi_RSI_Shift = 0;                                      // Shift
INPUT_GROUP("Oscillator strategy: Stochastic oscillator params");
INPUT int Oscillator_Indi_Stochastic_KPeriod = 8;                      // K line period
INPUT int Oscillator_Indi_Stochastic_DPeriod = 12;                     // D line period
INPUT int Oscillator_Indi_Stochastic_Slowing = 12;                     // Slowing
INPUT ENUM_MA_METHOD Oscillator_Indi_Stochastic_MA_Method = MODE_EMA;  // Moving Average method
INPUT ENUM_STO_PRICE Oscillator_Indi_Stochastic_Price_Field = 0;       // Price (0 - Low/High or 1 - Close/Close)
INPUT int Oscillator_Indi_Stochastic_Shift = 0;                        // Shift
INPUT_GROUP("Oscillator strategy: WPR oscillator params");
INPUT int Oscillator_Indi_WPR_Period = 18;  // Period
INPUT int Oscillator_Indi_WPR_Shift = 0;    // Shift

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
   * Validate soscillators's entry.
   */
  bool IsValidEntry(IndicatorBase *_indi, int _shift = 0) {
    bool _result = true;
    switch (Oscillator_Type) {
      case STG_OSCILLATOR_TYPE_AC:
        _result &= dynamic_cast<Indi_AC *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                   dynamic_cast<Indi_AC *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
        break;
      case STG_OSCILLATOR_TYPE_AD:
        _result &= dynamic_cast<Indi_AD *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                   dynamic_cast<Indi_AD *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
        break;
      case STG_OSCILLATOR_TYPE_AO:
        _result &= dynamic_cast<Indi_AO *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                   dynamic_cast<Indi_AO *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
        break;
      case STG_OSCILLATOR_TYPE_ATR:
        _result &= dynamic_cast<Indi_ATR *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                   dynamic_cast<Indi_ATR *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
        break;
      case STG_OSCILLATOR_TYPE_BEARS:
        _result &= dynamic_cast<Indi_BearsPower *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                   dynamic_cast<Indi_BearsPower *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
        break;
      case STG_OSCILLATOR_TYPE_BULLS:
        _result &= dynamic_cast<Indi_BullsPower *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                   dynamic_cast<Indi_BullsPower *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
        break;
      case STG_OSCILLATOR_TYPE_BWMFI:
        _result &= dynamic_cast<Indi_BWMFI *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                   dynamic_cast<Indi_BWMFI *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
        break;
      case STG_OSCILLATOR_TYPE_CCI:
        _result &= dynamic_cast<Indi_CCI *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                   dynamic_cast<Indi_CCI *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
        break;
      case STG_OSCILLATOR_TYPE_CHO:
        _result &= dynamic_cast<Indi_CHO *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                   dynamic_cast<Indi_CHO *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
        break;
      case STG_OSCILLATOR_TYPE_CHV:
        _result &= dynamic_cast<Indi_CHV *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                   dynamic_cast<Indi_CHV *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
        break;
      case STG_OSCILLATOR_TYPE_DEMARKER:
        _result &= dynamic_cast<Indi_DeMarker *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                   dynamic_cast<Indi_DeMarker *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
        break;
      case STG_OSCILLATOR_TYPE_MFI:
        _result &= dynamic_cast<Indi_MFI *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                   dynamic_cast<Indi_MFI *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
        break;
      case STG_OSCILLATOR_TYPE_RSI:
        _result &= dynamic_cast<Indi_RSI *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                   dynamic_cast<Indi_RSI *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
        break;
      case STG_OSCILLATOR_TYPE_STOCH:
        _result &= dynamic_cast<Indi_Stochastic *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                   dynamic_cast<Indi_Stochastic *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
        break;
      case STG_OSCILLATOR_TYPE_WPR:
        _result &= dynamic_cast<Indi_WPR *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift) &&
                   dynamic_cast<Indi_WPR *>(_indi).GetFlag(INDI_ENTRY_FLAG_IS_VALID, _shift + 1);
        break;
      default:
        break;
    }
    return _result;
  }

  /**
   * Event on strategy's init.
   */
  void OnInit() {
    // Initialize indicators.
    switch (Oscillator_Type) {
      case STG_OSCILLATOR_TYPE_AC:  // AC
      {
        IndiACParams ac_params(::Oscillator_Indi_AC_Shift);
        ac_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        ac_params.SetDataSourceType(Oscillator_Indi_AC_SourceType);
        SetIndicator(new Indi_AC(ac_params), ::Oscillator_Type);
        break;
      }
      case STG_OSCILLATOR_TYPE_AD:  // AD
      {
        IndiADParams ad_params(::Oscillator_Indi_AD_Shift);
        ad_params.SetDataSourceType(Oscillator_Indi_AD_SourceType);
        ad_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_AD(ad_params), ::Oscillator_Type);
        break;
      }
      case STG_OSCILLATOR_TYPE_AO:  // AO
      {
        IndiAOParams _indi_params(::Oscillator_Indi_Awesome_Shift);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_AO(_indi_params), ::Oscillator_Type);
        break;
      }
      case STG_OSCILLATOR_TYPE_ATR:  // ATR
      {
        IndiATRParams _indi_params(::Oscillator_Indi_ATR_Period, ::Oscillator_Indi_ATR_Shift);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_ATR(_indi_params), ::Oscillator_Type);
        break;
      }
      case STG_OSCILLATOR_TYPE_BEARS:  // Bears
      {
        IndiBearsPowerParams _indi_params(::Oscillator_Indi_BearsPower_Period,
                                          ::Oscillator_Indi_BearsPower_Applied_Price,
                                          ::Oscillator_Indi_BearsPower_Shift);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_BearsPower(_indi_params), ::Oscillator_Type);
        break;
      }
      case STG_OSCILLATOR_TYPE_BULLS:  // Bulls
      {
        IndiBullsPowerParams _indi_params(::Oscillator_Indi_BullsPower_Period,
                                          ::Oscillator_Indi_BullsPower_Applied_Price,
                                          ::Oscillator_Indi_BullsPower_Shift);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_BullsPower(_indi_params), ::Oscillator_Type);
        break;
      }
      case STG_OSCILLATOR_TYPE_BWMFI:  // BWMFI
      {
        IndiBWIndiMFIParams _indi_params(::Oscillator_Indi_BWMFI_Shift);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_BWMFI(_indi_params), ::Oscillator_Type);
        break;
      }
      case STG_OSCILLATOR_TYPE_CCI:  // CCI
      {
        IndiCCIParams _indi_params(::Oscillator_Indi_CCI_Period, ::Oscillator_Indi_CCI_Applied_Price,
                                   ::Oscillator_Indi_CCI_Shift);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_CCI(_indi_params), ::Oscillator_Type);
        break;
      }
      case STG_OSCILLATOR_TYPE_CHO:  // Chaikin (CHO)
      {
        IndiCHOParams _indi_params(::Oscillator_Indi_CHO_InpFastMA, ::Oscillator_Indi_CHO_InpSlowMA,
                                   ::Oscillator_Indi_CHO_InpSmoothMethod, ::Oscillator_Indi_CHO_InpVolumeType,
                                   ::Oscillator_Indi_CHO_Shift);
        _indi_params.SetDataSourceType(::Oscillator_Indi_CHO_SourceType);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_CHO(_indi_params), ::Oscillator_Type);
        break;
      }
      case STG_OSCILLATOR_TYPE_CHV:  // Chaikin Volatility (CHV)
      {
        IndiCHVParams _indi_params(::Oscillator_Indi_CHV_Smooth_Period, ::Oscillator_Indi_CHV_Period,
                                   ::Oscillator_Indi_CHV_Smooth_Method, ::Oscillator_Indi_CHV_Shift);
        _indi_params.SetDataSourceType(::Oscillator_Indi_CHV_SourceType);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_CHV(_indi_params), ::Oscillator_Type);
        break;
      }
      case STG_OSCILLATOR_TYPE_MFI:  // MFI
      {
        IndiMFIParams _indi_params(::MFI_Indi_MFI_MA_Period, ::MFI_Indi_MFI_Applied_Volume, ::MFI_Indi_MFI_Shift);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        _indi_params.SetDataSourceType(::Oscillator_Indi_MFI_SourceType);
        SetIndicator(new Indi_MFI(_indi_params), ::Oscillator_Type);
        break;
      }
      case STG_OSCILLATOR_TYPE_RSI:  // RSI
      {
        IndiRSIParams _indi_params(::Oscillator_Indi_RSI_Period, ::Oscillator_Indi_RSI_Applied_Price,
                                   ::Oscillator_Indi_RSI_Shift);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_RSI(_indi_params), ::Oscillator_Type);
        break;
      }
      case STG_OSCILLATOR_TYPE_DEMARKER:  // DeMarker
      {
        IndiDeMarkerParams _indi_params(::Oscillator_Indi_DeMarker_Period, ::Oscillator_Indi_DeMarker_Shift);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_DeMarker(_indi_params), ::Oscillator_Type);
        break;
      }
      case STG_OSCILLATOR_TYPE_STOCH:  // Stochastic
      {
        IndiStochParams _indi_params(::Oscillator_Indi_Stochastic_KPeriod, ::Oscillator_Indi_Stochastic_DPeriod,
                                     ::Oscillator_Indi_Stochastic_Slowing, ::Oscillator_Indi_Stochastic_MA_Method,
                                     ::Oscillator_Indi_Stochastic_Price_Field, ::Oscillator_Indi_Stochastic_Shift);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_Stochastic(_indi_params), ::Oscillator_Type);
        break;
      }
      case STG_OSCILLATOR_TYPE_WPR:  // WPR
      {
        IndiWPRParams _indi_params(::Oscillator_Indi_WPR_Period, ::Oscillator_Indi_WPR_Shift);
        _indi_params.SetTf(Get<ENUM_TIMEFRAMES>(STRAT_PARAM_TF));
        SetIndicator(new Indi_WPR(_indi_params), ::Oscillator_Type);
        break;
      }
      case STG_OSCILLATOR_TYPE_0_NONE:  // (None)
      default:
        break;
    }
  }

  /**
   * Check strategy's opening signal.
   */
  bool SignalOpen(ENUM_ORDER_TYPE _cmd, int _method, float _level = 0.0f, int _shift = 0) {
    IndicatorBase *_indi = GetIndicator(::Oscillator_Type);
    // uint _ishift = _indi.GetShift();
    bool _result = Oscillator_Type != STG_OSCILLATOR_TYPE_0_NONE && IsValidEntry(_indi, _shift);
    if (!_result) {
      // Returns false when indicator data is not valid.
      return false;
    }
    switch (_cmd) {
      case ORDER_TYPE_BUY:
        // Buy signal.
        _result &= _indi.IsIncreasing(1, 0, _shift);
        _result &= _indi.IsIncByPct(_level, 0, _shift, 2);
        if (_result && _method != 0) {
          if (METHOD(_method, 0)) _result &= _indi.IsDecreasing(1, 0, _shift + 1);
          if (METHOD(_method, 1)) _result &= _indi.IsIncreasing(4, 0, _shift + 3);
          if (METHOD(_method, 2))
            _result &= fmax4(_indi[_shift][0], _indi[_shift + 1][0], _indi[_shift + 2][0], _indi[_shift + 3][0]) ==
                       _indi[_shift][0];
        }
        break;
      case ORDER_TYPE_SELL:
        // Sell signal.
        _result &= _indi.IsDecreasing(1, 0, _shift);
        _result &= _indi.IsDecByPct(_level, 0, _shift, 2);
        if (_result && _method != 0) {
          if (METHOD(_method, 0)) _result &= _indi.IsIncreasing(1, 0, _shift + 1);
          if (METHOD(_method, 1)) _result &= _indi.IsDecreasing(4, 0, _shift + 3);
          if (METHOD(_method, 2))
            _result &= fmin4(_indi[_shift][0], _indi[_shift + 1][0], _indi[_shift + 2][0], _indi[_shift + 3][0]) ==
                       _indi[_shift][0];
        }
        break;
    }
    return _result;
  }
};
