#define MAX_CHECKPOINT_LOAD 4

#define D_TEMP_JOB_FERMER_START 9012
#define D_TEMP_JOB_FERMER_END 9013

enum T_LOAD_FERMER_JOB_STRUCT // временные работы
{
	Float: TC_POS_X,
	Float: TC_POS_Y,
	Float: TC_POS_Z,
};

new t_load_fermer_job[MAX_CHECKPOINT_LOAD][T_LOAD_FERMER_JOB_STRUCT] =
{
	{1568.2119,1404.9947,12.6473},
	{1545.4337, 1419.3980, 12.9292},
	{1534.0731, 1401.5449, 14.0891},
	{1544.0891, 1371.1042, 14.9579}
};

new const Float: fermer_job_unload_cp[1][3] = // позиции разгрузки
{
	{1596.2584, 1396.4378, 12.2239}
};