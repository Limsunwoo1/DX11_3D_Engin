#include "Player.h"
#include "CameraScript.h"
#include "GameObj.h"
#include "RigidBody.h"
#include "Input.h"
#include "TimeMgr.h"

namespace dru
{
	CPlayer::CPlayer()
	{

//		CRigidBody* rigidbody = this->AddComponent<CRigidBody>(eComponentType::RigidBody);

		CSpriteRenderer* SpriteRenderer = AddComponent<CSpriteRenderer>(eComponentType::Renderer);

	}

	CPlayer::~CPlayer()
	{

	}

	void CPlayer::Initialize()
	{

		CGameObj::Initialize();
	}

	void CPlayer::update()
	{
		CGameObj::update();

		CTransform* tr = GetComponent<CTransform>();
		Vector3 rotation = tr->GetRotation();
		if (CInput::GetKeyDown(eKeyCode::Z))
		{
			rotation.x += 20.f * CTimeMgr::DeltaTime();
		}
		else if (CInput::GetKeyDown(eKeyCode::X))
		{
			rotation.y += 20.f * CTimeMgr::DeltaTime();
		}
		else if (CInput::GetKeyDown(eKeyCode::C))
		{
			rotation.z += 20.f * CTimeMgr::DeltaTime();
		}

		tr->SetRotation(rotation);
	}

	void CPlayer::fixedUpdate()
	{
		CGameObj::fixedUpdate();
	}

	void CPlayer::render()
	{
		
		CGameObj::render();
	}

	void CPlayer::fontRender()
	{



	}



}