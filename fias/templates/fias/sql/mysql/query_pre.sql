INSERT INTO fias_addrobjindex (aoguid, aolevel, scname, fullname, item_weight)

(SELECT DISTINCT (ao.aoguid) AS aoguid,
    ao.aolevel,
    sn.socrname AS scname,
    if(sn.position = 0,concat(lcase(sn.socrname), " ", ao.formalname), concat(ao.formalname, " ", lcase(sn.socrname))) AS fullname,
    sn.item_weight
    FROM fias_addrobj AS ao
      INNER JOIN fias_socrbase AS sn ON (sn.scname = ao.shortname AND sn.level = ao.aolevel)
    WHERE ao.aolevel=1)

UNION

(SELECT DISTINCT (ao2.aoguid) AS aoguid,
    ao2.aolevel,
    concat(sn1.socrname, ", ", sn2.socrname) AS scname,
    concat(if(sn1.position = 0,concat(lcase(sn1.socrname), " ", ao1.formalname), concat(ao1.formalname, " ", lcase(sn1.socrname))), ", ",
           if(sn2.position = 0,concat(lcase(sn2.socrname), " ", ao2.formalname), concat(ao2.formalname, " ", lcase(sn2.socrname)))
    ) AS fullname,
    sn2.item_weight
    FROM fias_addrobj AS ao1
        INNER JOIN fias_addrobj AS ao2 ON (ao2.parentguid=ao1.aoguid)

        INNER JOIN fias_socrbase AS sn1 ON (sn1.scname = ao1.shortname AND sn1.level = ao1.aolevel)
        INNER JOIN fias_socrbase AS sn2 ON (sn2.scname = ao2.shortname AND sn2.level = ao2.aolevel)
    WHERE ao1.aolevel=1)

UNION

(SELECT DISTINCT (ao3.aoguid) AS aoguid,
    ao3.aolevel,
    concat(sn1.socrname, ", ", sn2.socrname, ", ", sn3.socrname) AS scname,
    concat(if(sn1.position = 0,concat(lcase(sn1.socrname), " ", ao1.formalname), concat(ao1.formalname, " ", lcase(sn1.socrname))), ", ",
           if(sn2.position = 0,concat(lcase(sn2.socrname), " ", ao2.formalname), concat(ao2.formalname, " ", lcase(sn2.socrname))), ", ",
           if(sn3.position = 0,concat(lcase(sn3.socrname), " ", ao3.formalname), concat(ao3.formalname, " ", lcase(sn3.socrname)))
    ) AS fullname,
    sn3.item_weight
    FROM fias_addrobj AS ao1
        INNER JOIN fias_addrobj AS ao2 ON (ao2.parentguid=ao1.aoguid)
        INNER JOIN fias_addrobj AS ao3 ON (ao3.parentguid=ao2.aoguid)

        INNER JOIN fias_socrbase AS sn1 ON (sn1.scname = ao1.shortname AND sn1.level = ao1.aolevel)
        INNER JOIN fias_socrbase AS sn2 ON (sn2.scname = ao2.shortname AND sn2.level = ao2.aolevel)
        INNER JOIN fias_socrbase AS sn3 ON (sn3.scname = ao3.shortname AND sn3.level = ao3.aolevel)
    WHERE ao1.aolevel=1)

UNION

(SELECT DISTINCT (ao4.aoguid) AS aoguid,
    ao4.aolevel,
    concat(sn1.socrname
            , ", ", sn2.socrname, ", ", sn3.socrname, ", ", sn4.socrname) AS scname,
    concat(if(sn1.position = 0,concat(lcase(sn1.socrname), " ", ao1.formalname), concat(ao1.formalname, " ", lcase(sn1.socrname))), ", ",
           if(sn2.position = 0,concat(lcase(sn2.socrname), " ", ao2.formalname), concat(ao2.formalname, " ", lcase(sn2.socrname))), ", ",
           if(sn3.position = 0,concat(lcase(sn3.socrname), " ", ao3.formalname), concat(ao3.formalname, " ", lcase(sn3.socrname))), ", ",
           if(sn4.position = 0,concat(lcase(sn4.socrname), " ", ao4.formalname), concat(ao4.formalname, " ", lcase(sn4.socrname)))
    ) AS fullname,
    sn4.item_weight
    FROM fias_addrobj AS ao1
        INNER JOIN fias_addrobj AS ao2 ON (ao2.parentguid=ao1.aoguid)
        INNER JOIN fias_addrobj AS ao3 ON (ao3.parentguid=ao2.aoguid)
        INNER JOIN fias_addrobj AS ao4 ON (ao4.parentguid=ao3.aoguid)

        INNER JOIN fias_socrbase AS sn1 ON (sn1.scname = ao1.shortname AND sn1.level = ao1.aolevel)
        INNER JOIN fias_socrbase AS sn2 ON (sn2.scname = ao2.shortname AND sn2.level = ao2.aolevel)
        INNER JOIN fias_socrbase AS sn3 ON (sn3.scname = ao3.shortname AND sn3.level = ao3.aolevel)
        INNER JOIN fias_socrbase AS sn4 ON (sn4.scname = ao4.shortname AND sn4.level = ao4.aolevel)
    WHERE ao1.aolevel=1)

UNION

(SELECT DISTINCT (ao5.aoguid) AS aoguid,
    ao5.aolevel,
    concat(sn1.socrname
            , ", ", sn2.socrname
            , ", ", sn3.socrname
            , ", ", sn4.socrname
            , ", ", sn5.socrname
            ) AS scname,
    concat(if(sn1.position = 0,concat(lcase(sn1.socrname), " ", ao1.formalname), concat(ao1.formalname, " ", lcase(sn1.socrname))), ", ",
           if(sn2.position = 0,concat(lcase(sn2.socrname), " ", ao2.formalname), concat(ao2.formalname, " ", lcase(sn2.socrname))), ", ",
           if(sn3.position = 0,concat(lcase(sn3.socrname), " ", ao3.formalname), concat(ao3.formalname, " ", lcase(sn3.socrname))), ", ",
           if(sn4.position = 0,concat(lcase(sn4.socrname), " ", ao4.formalname), concat(ao4.formalname, " ", lcase(sn4.socrname))), ", ",
           if(sn5.position = 0,concat(lcase(sn5.socrname), " ", ao5.formalname), concat(ao5.formalname, " ", lcase(sn5.socrname)))
    ) AS fullname,
    sn5.item_weight
    FROM fias_addrobj AS ao1
        INNER JOIN fias_addrobj AS ao2 ON (ao2.parentguid=ao1.aoguid)
        INNER JOIN fias_addrobj AS ao3 ON (ao3.parentguid=ao2.aoguid)
        INNER JOIN fias_addrobj AS ao4 ON (ao4.parentguid=ao3.aoguid)
        INNER JOIN fias_addrobj AS ao5 ON (ao5.parentguid=ao4.aoguid)

        INNER JOIN fias_socrbase AS sn1 ON (sn1.scname = ao1.shortname AND sn1.level = ao1.aolevel)
        INNER JOIN fias_socrbase AS sn2 ON (sn2.scname = ao2.shortname AND sn2.level = ao2.aolevel)
        INNER JOIN fias_socrbase AS sn3 ON (sn3.scname = ao3.shortname AND sn3.level = ao3.aolevel)
        INNER JOIN fias_socrbase AS sn4 ON (sn4.scname = ao4.shortname AND sn4.level = ao4.aolevel)
        INNER JOIN fias_socrbase AS sn5 ON (sn5.scname = ao5.shortname AND sn5.level = ao5.aolevel)
    WHERE ao1.aolevel=1)

UNION

(SELECT DISTINCT (ao6.aoguid) AS aoguid,
    ao6.aolevel,
    concat(sn1.socrname
            , ", ", sn2.socrname
            , ", ", sn3.socrname
            , ", ", sn4.socrname
            , ", ", sn5.socrname
            , ", ", sn6.socrname
            ) AS scname,
    concat(if(sn1.position = 0,concat(lcase(sn1.socrname), " ", ao1.formalname), concat(ao1.formalname, " ", lcase(sn1.socrname))), ", ",
           if(sn2.position = 0,concat(lcase(sn2.socrname), " ", ao2.formalname), concat(ao2.formalname, " ", lcase(sn2.socrname))), ", ",
           if(sn3.position = 0,concat(lcase(sn3.socrname), " ", ao3.formalname), concat(ao3.formalname, " ", lcase(sn3.socrname))), ", ",
           if(sn4.position = 0,concat(lcase(sn4.socrname), " ", ao4.formalname), concat(ao4.formalname, " ", lcase(sn4.socrname))), ", ",
           if(sn5.position = 0,concat(lcase(sn5.socrname), " ", ao5.formalname), concat(ao5.formalname, " ", lcase(sn5.socrname))), ", ",
           if(sn6.position = 0,concat(lcase(sn6.socrname), " ", ao6.formalname), concat(ao6.formalname, " ", lcase(sn6.socrname)))
            ) AS fullname,
    sn6.item_weight
    FROM fias_addrobj AS ao1
        INNER JOIN fias_addrobj AS ao2 ON (ao2.parentguid=ao1.aoguid)
        INNER JOIN fias_addrobj AS ao3 ON (ao3.parentguid=ao2.aoguid)
        INNER JOIN fias_addrobj AS ao4 ON (ao4.parentguid=ao3.aoguid)
        INNER JOIN fias_addrobj AS ao5 ON (ao5.parentguid=ao4.aoguid)
        INNER JOIN fias_addrobj AS ao6 ON (ao6.parentguid=ao5.aoguid)

        INNER JOIN fias_socrbase AS sn1 ON (sn1.scname = ao1.shortname AND sn1.level = ao1.aolevel)
        INNER JOIN fias_socrbase AS sn2 ON (sn2.scname = ao2.shortname AND sn2.level = ao2.aolevel)
        INNER JOIN fias_socrbase AS sn3 ON (sn3.scname = ao3.shortname AND sn3.level = ao3.aolevel)
        INNER JOIN fias_socrbase AS sn4 ON (sn4.scname = ao4.shortname AND sn4.level = ao4.aolevel)
        INNER JOIN fias_socrbase AS sn5 ON (sn5.scname = ao5.shortname AND sn5.level = ao5.aolevel)
        INNER JOIN fias_socrbase AS sn6 ON (sn6.scname = ao6.shortname AND sn6.level = ao6.aolevel)
    WHERE ao1.aolevel=1)

UNION

(SELECT DISTINCT (ao7.aoguid) AS aoguid,
    ao7.aolevel,
    concat(sn1.socrname
            , ", ", sn2.socrname
            , ", ", sn3.socrname
            , ", ", sn4.socrname
            , ", ", sn5.socrname
            , ", ", sn6.socrname
            , ", ", sn7.socrname
            ) AS scname,
    concat(if(sn1.position = 0,concat(lcase(sn1.socrname), " ", ao1.formalname), concat(ao1.formalname, " ", lcase(sn1.socrname))), ", ",
           if(sn2.position = 0,concat(lcase(sn2.socrname), " ", ao2.formalname), concat(ao2.formalname, " ", lcase(sn2.socrname))), ", ",
           if(sn3.position = 0,concat(lcase(sn3.socrname), " ", ao3.formalname), concat(ao3.formalname, " ", lcase(sn3.socrname))), ", ",
           if(sn4.position = 0,concat(lcase(sn4.socrname), " ", ao4.formalname), concat(ao4.formalname, " ", lcase(sn4.socrname))), ", ",
           if(sn5.position = 0,concat(lcase(sn5.socrname), " ", ao5.formalname), concat(ao5.formalname, " ", lcase(sn5.socrname))), ", ",
           if(sn6.position = 0,concat(lcase(sn6.socrname), " ", ao6.formalname), concat(ao6.formalname, " ", lcase(sn6.socrname))), ", ",
           if(sn7.position = 0,concat(lcase(sn7.socrname), " ", ao7.formalname), concat(ao7.formalname, " ", lcase(sn7.socrname)))
            ) AS fullname,
    sn7.item_weight
    FROM fias_addrobj AS ao1
        INNER JOIN fias_addrobj AS ao2 ON (ao2.parentguid=ao1.aoguid)
        INNER JOIN fias_addrobj AS ao3 ON (ao3.parentguid=ao2.aoguid)
        INNER JOIN fias_addrobj AS ao4 ON (ao4.parentguid=ao3.aoguid)
        INNER JOIN fias_addrobj AS ao5 ON (ao5.parentguid=ao4.aoguid)
        INNER JOIN fias_addrobj AS ao6 ON (ao6.parentguid=ao5.aoguid)
        INNER JOIN fias_addrobj AS ao7 ON (ao7.parentguid=ao6.aoguid)

        INNER JOIN fias_socrbase AS sn1 ON (sn1.scname = ao1.shortname AND sn1.level = ao1.aolevel)
        INNER JOIN fias_socrbase AS sn2 ON (sn2.scname = ao2.shortname AND sn2.level = ao2.aolevel)
        INNER JOIN fias_socrbase AS sn3 ON (sn3.scname = ao3.shortname AND sn3.level = ao3.aolevel)
        INNER JOIN fias_socrbase AS sn4 ON (sn4.scname = ao4.shortname AND sn4.level = ao4.aolevel)
        INNER JOIN fias_socrbase AS sn5 ON (sn5.scname = ao5.shortname AND sn5.level = ao5.aolevel)
        INNER JOIN fias_socrbase AS sn6 ON (sn6.scname = ao6.shortname AND sn6.level = ao6.aolevel)
        INNER JOIN fias_socrbase AS sn7 ON (sn7.scname = ao7.shortname AND sn7.level = ao7.aolevel)
    WHERE ao1.aolevel=1)

UNION

(SELECT DISTINCT (ao8.aoguid) AS aoguid,
    ao8.aolevel,
    concat(sn1.socrname
            , ", ", sn2.socrname
            , ", ", sn3.socrname
            , ", ", sn4.socrname
            , ", ", sn5.socrname
            , ", ", sn6.socrname
            , ", ", sn7.socrname
            , ", ", sn8.socrname
            ) AS scname,
    concat(if(sn1.position = 0,concat(lcase(sn1.socrname), " ", ao1.formalname), concat(ao1.formalname, " ", lcase(sn1.socrname))), ", ",
           if(sn2.position = 0,concat(lcase(sn2.socrname), " ", ao2.formalname), concat(ao2.formalname, " ", lcase(sn2.socrname))), ", ",
           if(sn3.position = 0,concat(lcase(sn3.socrname), " ", ao3.formalname), concat(ao3.formalname, " ", lcase(sn3.socrname))), ", ",
           if(sn4.position = 0,concat(lcase(sn4.socrname), " ", ao4.formalname), concat(ao4.formalname, " ", lcase(sn4.socrname))), ", ",
           if(sn5.position = 0,concat(lcase(sn5.socrname), " ", ao5.formalname), concat(ao5.formalname, " ", lcase(sn5.socrname))), ", ",
           if(sn6.position = 0,concat(lcase(sn6.socrname), " ", ao6.formalname), concat(ao6.formalname, " ", lcase(sn6.socrname))), ", ",
           if(sn7.position = 0,concat(lcase(sn7.socrname), " ", ao7.formalname), concat(ao7.formalname, " ", lcase(sn7.socrname))), ", ",
           if(sn8.position = 0,concat(lcase(sn8.socrname), " ", ao8.formalname), concat(ao8.formalname, " ", lcase(sn8.socrname)))
            ) AS fullname,
    sn8.item_weight
    FROM fias_addrobj AS ao1
        INNER JOIN fias_addrobj AS ao2 ON (ao2.parentguid=ao1.aoguid)
        INNER JOIN fias_addrobj AS ao3 ON (ao3.parentguid=ao2.aoguid)
        INNER JOIN fias_addrobj AS ao4 ON (ao4.parentguid=ao3.aoguid)
        INNER JOIN fias_addrobj AS ao5 ON (ao5.parentguid=ao4.aoguid)
        INNER JOIN fias_addrobj AS ao6 ON (ao6.parentguid=ao5.aoguid)
        INNER JOIN fias_addrobj AS ao7 ON (ao7.parentguid=ao6.aoguid)
        INNER JOIN fias_addrobj AS ao8 ON (ao8.parentguid=ao7.aoguid)

        INNER JOIN fias_socrbase AS sn1 ON (sn1.scname = ao1.shortname AND sn1.level = ao1.aolevel)
        INNER JOIN fias_socrbase AS sn2 ON (sn2.scname = ao2.shortname AND sn2.level = ao2.aolevel)
        INNER JOIN fias_socrbase AS sn3 ON (sn3.scname = ao3.shortname AND sn3.level = ao3.aolevel)
        INNER JOIN fias_socrbase AS sn4 ON (sn4.scname = ao4.shortname AND sn4.level = ao4.aolevel)
        INNER JOIN fias_socrbase AS sn5 ON (sn5.scname = ao5.shortname AND sn5.level = ao5.aolevel)
        INNER JOIN fias_socrbase AS sn6 ON (sn6.scname = ao6.shortname AND sn6.level = ao6.aolevel)
        INNER JOIN fias_socrbase AS sn7 ON (sn7.scname = ao7.shortname AND sn7.level = ao7.aolevel)
        INNER JOIN fias_socrbase AS sn8 ON (sn8.scname = ao8.shortname AND sn8.level = ao8.aolevel)
    WHERE ao1.aolevel=1);
