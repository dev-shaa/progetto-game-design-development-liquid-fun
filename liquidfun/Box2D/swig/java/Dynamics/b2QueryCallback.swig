class b2QueryCallback
{
public:
	b2QueryCallback() {}
	virtual ~b2QueryCallback() {}

	/// Called for each fixture found in the query AABB.
	/// @return false to terminate the query.
	virtual bool ReportFixture(b2Fixture* fixture) = 0;

	/// Called for each particle found in the query AABB.
	/// @return false to terminate the query.
	virtual bool ReportParticle(const b2ParticleSystem* particleSystem,
								int32 index)
	{
		B2_NOT_USED(particleSystem);
		B2_NOT_USED(index);
		return false;
	}

	/// Cull an entire particle system from b2World::QueryAABB. Ignored for
	/// b2ParticleSystem::QueryAABB.
	/// @return true if you want to include particleSystem in the AABB query,
	/// or false to cull particleSystem from the AABB query.
	virtual bool ShouldQueryParticleSystem(
		const b2ParticleSystem* particleSystem)
	{
		B2_NOT_USED(particleSystem);
		return true;
	}
};