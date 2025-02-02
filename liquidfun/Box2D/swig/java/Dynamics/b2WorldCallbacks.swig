/*
 * Copyright (c) 2014 Google, Inc.
 *
 * Extended by Marco Faella in 2016, marfaella@gmail.com.
 *
 * This software is provided 'as-is', without any express or implied
 * warranty.  In no event will the authors be held liable for any damages
 * arising from the use of this software.
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 * 1. The origin of this software must not be misrepresented; you must not
 * claim that you wrote the original software. If you use this software
 * in a product, an acknowledgment in the product documentation would be
 * appreciated but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 * misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 */

%module(directors="1") b2WorldCallbacks;

%feature("director") b2QueryCallback;

/// Forward declarations
class b2ParticleSystem;

%nodefaultctor b2QueryCallback;
class b2QueryCallback
{
public:
    b2QueryCallback() {}
    virtual ~b2QueryCallback();
    virtual bool ReportFixture(b2Fixture* fixture) = 0;
    virtual bool ReportParticle(const b2ParticleSystem* particleSystem,
                                int32 index);
};

%feature("director") b2RayCastCallback;

%nodefaultctor b2RayCastCallback;
class b2RayCastCallback
{
public:
    b2RayCastCallback() {}
    virtual ~b2RayCastCallback();
    virtual float32 ReportFixture(b2Fixture* fixture, const b2Vec2& point,				const b2Vec2& normal, float32 fraction) = 0;
    virtual float32 ReportParticle(const b2ParticleSystem* particleSystem,                 		   int32 index, const b2Vec2& point,				   const b2Vec2& normal, float32 fraction);
};


%insert("runtime") %{
#define SWIG_JAVA_NO_DETACH_CURRENT_THREAD
%}

%feature("director") b2ContactListener;

%nodefaultctor b2ContactListener;
class b2ContactListener
{
public:
    b2ContactListener() {}
    virtual ~b2ContactListener() {}
    virtual void BeginContact(b2Contact* contact);
    virtual void EndContact(b2Contact* contact);
/*    virtual void BeginContact(b2ParticleSystem* particleSystem,
							  b2ParticleBodyContact* particleBodyContact);
    virtual void BeginContact(b2ParticleSystem* particleSystem,
							  b2ParticleContact* particleContact);
*/
};