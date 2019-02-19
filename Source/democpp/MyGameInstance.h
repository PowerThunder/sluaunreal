// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "LuaState.h"
#include "Engine/GameInstance.h"
#include "MyGameInstance.generated.h"

/**
 * 
 */
UCLASS()
class DEMOCPP_API UMyGameInstance : public UGameInstance
{
	GENERATED_BODY()
	
public:
	UMyGameInstance();

	/** virtual function to allow custom GameInstances an opportunity to set up what it needs */
	virtual void Init() override;
	/** virtual function to allow custom GameInstances an opportunity to do cleanup when shutting down */
	virtual void Shutdown() override;

	// create global state, freed on app exit
	slua::LuaState state;
};
