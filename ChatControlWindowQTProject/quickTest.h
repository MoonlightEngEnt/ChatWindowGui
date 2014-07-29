#ifndef QUICKTEST_H
#define QUICKTEST_H

#include "quickTestGlobalDefinitions.h"

namespace quick
{
	struct QUICKTESTDLL_API UeStatus
	{
	public:
		virtual bool GetUePresent() = 0;
		virtual bool GetUeAttached() = 0;
		virtual bool GetUeHeartbeat() = 0;
		virtual bool GetNetworkPresent() = 0;
		virtual bool GetOnNet() = 0;
		virtual signed char GetRssi() = 0;
		virtual unsigned char GetSigQual() = 0;
		virtual unsigned char GetNet() = 0;
		virtual void Release() = 0;
	};

	extern "C" QUICKTESTDLL_API UeStatus* _stdcall GetUeStatus();

	class ImplementUeStatus : public UeStatus
	{
	public:
		
		bool GetUePresent();
		bool GetUeAttached();
		bool GetUeHeartbeat();
		bool GetNetworkPresent();
		bool GetOnNet();
		signed char GetRssi();
		unsigned char GetSigQual();
		unsigned char GetNet();
		void Release();
	};
}

#endif //QUICKTEST_H