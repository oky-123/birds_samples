
/*view definition (get):
control_g(I, C, N) :- p_0(I, C, N).
p_0(I, C, N) :- base_g(I, C, N).
*/

CREATE OR REPLACE VIEW public.control_g AS 
SELECT __dummy__.COL0 AS I,__dummy__.COL1 AS C,__dummy__.COL2 AS N 
FROM (SELECT control_g_a3_0.COL0 AS COL0, control_g_a3_0.COL1 AS COL1, control_g_a3_0.COL2 AS COL2 
FROM (SELECT p_0_a3_0.COL0 AS COL0, p_0_a3_0.COL1 AS COL1, p_0_a3_0.COL2 AS COL2 
FROM (SELECT base_g_a3_0.I AS COL0, base_g_a3_0.C AS COL1, base_g_a3_0.N AS COL2 
FROM public.base_g AS base_g_a3_0  ) AS p_0_a3_0  ) AS control_g_a3_0  ) AS __dummy__;


CREATE OR REPLACE FUNCTION public.control_g_delta_action()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
  DECLARE
  text_var1 text;
  text_var2 text;
  text_var3 text;
  deletion_data text;
  insertion_data text;
  json_data text;
  result text;
  user_name text;
  temprecΔ_del_base_g public.base_g%ROWTYPE;
temprecΔ_ins_base_g public.base_g%ROWTYPE;
  BEGIN
    IF NOT EXISTS (SELECT * FROM information_schema.tables WHERE table_name = 'control_g_delta_action_flag') THEN
        -- RAISE LOG 'execute procedure control_g_delta_action';
        CREATE TEMPORARY TABLE control_g_delta_action_flag ON COMMIT DROP AS (SELECT true as finish);
        IF EXISTS (SELECT WHERE false )
        THEN 
          RAISE check_violation USING MESSAGE = 'Invalid view update: constraints on the view are violated';
        END IF;
        IF EXISTS (SELECT WHERE false )
        THEN 
          RAISE check_violation USING MESSAGE = 'Invalid view update: constraints on the source relations are violated';
        END IF;
        CREATE TEMPORARY TABLE Δ_del_base_g WITH OIDS ON COMMIT DROP AS SELECT (ROW(COL0,COL1,COL2) :: public.base_g).* 
            FROM (SELECT Δ_del_base_g_a3_0.COL0 AS COL0, Δ_del_base_g_a3_0.COL1 AS COL1, Δ_del_base_g_a3_0.COL2 AS COL2 
FROM (SELECT base_g_a3_0.I AS COL0, base_g_a3_0.C AS COL1, base_g_a3_0.N AS COL2 
FROM public.base_g AS base_g_a3_0 
WHERE NOT EXISTS ( SELECT * 
FROM (SELECT control_g_a3_0.I AS COL0, control_g_a3_0.C AS COL1, control_g_a3_0.N AS COL2 
FROM public.control_g AS control_g_a3_0 
WHERE NOT EXISTS ( SELECT * 
FROM __temp__Δ_del_control_g AS __temp__Δ_del_control_g_a3 
WHERE __temp__Δ_del_control_g_a3.N = control_g_a3_0.N AND __temp__Δ_del_control_g_a3.C = control_g_a3_0.C AND __temp__Δ_del_control_g_a3.I = control_g_a3_0.I )  UNION SELECT __temp__Δ_ins_control_g_a3_0.I AS COL0, __temp__Δ_ins_control_g_a3_0.C AS COL1, __temp__Δ_ins_control_g_a3_0.N AS COL2 
FROM __temp__Δ_ins_control_g AS __temp__Δ_ins_control_g_a3_0  ) AS new_control_g_a3 
WHERE new_control_g_a3.COL2 = base_g_a3_0.N AND new_control_g_a3.COL1 = base_g_a3_0.C AND new_control_g_a3.COL0 = base_g_a3_0.I ) ) AS Δ_del_base_g_a3_0  ) AS Δ_del_base_g_extra_alias;

CREATE TEMPORARY TABLE Δ_ins_base_g WITH OIDS ON COMMIT DROP AS SELECT (ROW(COL0,COL1,COL2) :: public.base_g).* 
            FROM (SELECT Δ_ins_base_g_a3_0.COL0 AS COL0, Δ_ins_base_g_a3_0.COL1 AS COL1, Δ_ins_base_g_a3_0.COL2 AS COL2 
FROM (SELECT new_control_g_a3_0.COL0 AS COL0, new_control_g_a3_0.COL1 AS COL1, new_control_g_a3_0.COL2 AS COL2 
FROM (SELECT control_g_a3_0.I AS COL0, control_g_a3_0.C AS COL1, control_g_a3_0.N AS COL2 
FROM public.control_g AS control_g_a3_0 
WHERE NOT EXISTS ( SELECT * 
FROM __temp__Δ_del_control_g AS __temp__Δ_del_control_g_a3 
WHERE __temp__Δ_del_control_g_a3.N = control_g_a3_0.N AND __temp__Δ_del_control_g_a3.C = control_g_a3_0.C AND __temp__Δ_del_control_g_a3.I = control_g_a3_0.I )  UNION SELECT __temp__Δ_ins_control_g_a3_0.I AS COL0, __temp__Δ_ins_control_g_a3_0.C AS COL1, __temp__Δ_ins_control_g_a3_0.N AS COL2 
FROM __temp__Δ_ins_control_g AS __temp__Δ_ins_control_g_a3_0  ) AS new_control_g_a3_0 
WHERE NOT EXISTS ( SELECT * 
FROM public.base_g AS base_g_a3 
WHERE base_g_a3.N = new_control_g_a3_0.COL2 AND base_g_a3.C = new_control_g_a3_0.COL1 AND base_g_a3.I = new_control_g_a3_0.COL0 ) ) AS Δ_ins_base_g_a3_0  ) AS Δ_ins_base_g_extra_alia 
            EXCEPT 
            SELECT * FROM  public.base_g; 

FOR temprecΔ_del_base_g IN ( SELECT * FROM Δ_del_base_g) LOOP 
            DELETE FROM public.base_g WHERE ROW(I,C,N) =  temprecΔ_del_base_g;
            END LOOP;
DROP TABLE Δ_del_base_g;

INSERT INTO public.base_g (SELECT * FROM  Δ_ins_base_g) ; 
DROP TABLE Δ_ins_base_g;
    END IF;
    RETURN NULL;
  EXCEPTION
    WHEN object_not_in_prerequisite_state THEN
        RAISE object_not_in_prerequisite_state USING MESSAGE = 'no permission to insert or delete or update to source relations of public.control_g';
    WHEN OTHERS THEN
        GET STACKED DIAGNOSTICS text_var1 = RETURNED_SQLSTATE,
                                text_var2 = PG_EXCEPTION_DETAIL,
                                text_var3 = MESSAGE_TEXT;
        RAISE SQLSTATE 'DA000' USING MESSAGE = 'error on the trigger of public.control_g ; error code: ' || text_var1 || ' ; ' || text_var2 ||' ; ' || text_var3;
        RETURN NULL;
  END;
$$;

CREATE OR REPLACE FUNCTION public.control_g_materialization()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
  DECLARE
  text_var1 text;
  text_var2 text;
  text_var3 text;
  BEGIN
    IF NOT EXISTS (SELECT * FROM information_schema.tables WHERE table_name = '__temp__Δ_ins_control_g' OR table_name = '__temp__Δ_del_control_g')
    THEN
        -- RAISE LOG 'execute procedure control_g_materialization';
        CREATE TEMPORARY TABLE __temp__Δ_ins_control_g ( LIKE public.control_g INCLUDING ALL ) WITH OIDS ON COMMIT DROP;
        CREATE CONSTRAINT TRIGGER __temp__control_g_trigger_delta_action
        AFTER INSERT OR UPDATE OR DELETE ON 
            __temp__Δ_ins_control_g DEFERRABLE INITIALLY DEFERRED 
            FOR EACH ROW EXECUTE PROCEDURE public.control_g_delta_action();

        CREATE TEMPORARY TABLE __temp__Δ_del_control_g ( LIKE public.control_g INCLUDING ALL ) WITH OIDS ON COMMIT DROP;
        CREATE CONSTRAINT TRIGGER __temp__control_g_trigger_delta_action
        AFTER INSERT OR UPDATE OR DELETE ON 
            __temp__Δ_del_control_g DEFERRABLE INITIALLY DEFERRED 
            FOR EACH ROW EXECUTE PROCEDURE public.control_g_delta_action();
    END IF;
    RETURN NULL;
  EXCEPTION
    WHEN object_not_in_prerequisite_state THEN
        RAISE object_not_in_prerequisite_state USING MESSAGE = 'no permission to insert or delete or update to source relations of public.control_g';
    WHEN OTHERS THEN
        GET STACKED DIAGNOSTICS text_var1 = RETURNED_SQLSTATE,
                                text_var2 = PG_EXCEPTION_DETAIL,
                                text_var3 = MESSAGE_TEXT;
        RAISE SQLSTATE 'DA000' USING MESSAGE = 'error on the trigger of public.control_g ; error code: ' || text_var1 || ' ; ' || text_var2 ||' ; ' || text_var3;
        RETURN NULL;
  END;
$$;

DROP TRIGGER IF EXISTS control_g_trigger_materialization ON public.control_g;
CREATE TRIGGER control_g_trigger_materialization
    BEFORE INSERT OR UPDATE OR DELETE ON
      public.control_g FOR EACH STATEMENT EXECUTE PROCEDURE public.control_g_materialization();

CREATE OR REPLACE FUNCTION public.control_g_update()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
  DECLARE
  text_var1 text;
  text_var2 text;
  text_var3 text;
  BEGIN
    -- RAISE LOG 'execute procedure control_g_update';
    IF TG_OP = 'INSERT' THEN
      -- RAISE LOG 'NEW: %', NEW;
      IF (SELECT count(*) FILTER (WHERE j.value = jsonb 'null') FROM  jsonb_each(to_jsonb(NEW)) j) > 0 THEN 
        RAISE check_violation USING MESSAGE = 'Invalid update on view: view does not accept null value';
      END IF;
      DELETE FROM __temp__Δ_del_control_g WHERE ROW(I,C,N) = NEW;
      INSERT INTO __temp__Δ_ins_control_g SELECT (NEW).*; 
    ELSIF TG_OP = 'UPDATE' THEN
      IF (SELECT count(*) FILTER (WHERE j.value = jsonb 'null') FROM  jsonb_each(to_jsonb(NEW)) j) > 0 THEN 
        RAISE check_violation USING MESSAGE = 'Invalid update on view: view does not accept null value';
      END IF;
      DELETE FROM __temp__Δ_ins_control_g WHERE ROW(I,C,N) = OLD;
      INSERT INTO __temp__Δ_del_control_g SELECT (OLD).*;
      DELETE FROM __temp__Δ_del_control_g WHERE ROW(I,C,N) = NEW;
      INSERT INTO __temp__Δ_ins_control_g SELECT (NEW).*; 
    ELSIF TG_OP = 'DELETE' THEN
      -- RAISE LOG 'OLD: %', OLD;
      DELETE FROM __temp__Δ_ins_control_g WHERE ROW(I,C,N) = OLD;
      INSERT INTO __temp__Δ_del_control_g SELECT (OLD).*;
    END IF;
    RETURN NULL;
  EXCEPTION
    WHEN object_not_in_prerequisite_state THEN
        RAISE object_not_in_prerequisite_state USING MESSAGE = 'no permission to insert or delete or update to source relations of public.control_g';
    WHEN OTHERS THEN
        GET STACKED DIAGNOSTICS text_var1 = RETURNED_SQLSTATE,
                                text_var2 = PG_EXCEPTION_DETAIL,
                                text_var3 = MESSAGE_TEXT;
        RAISE SQLSTATE 'DA000' USING MESSAGE = 'error on the trigger of public.control_g ; error code: ' || text_var1 || ' ; ' || text_var2 ||' ; ' || text_var3;
        RETURN NULL;
  END;
$$;

DROP TRIGGER IF EXISTS control_g_trigger_update ON public.control_g;
CREATE TRIGGER control_g_trigger_update
    INSTEAD OF INSERT OR UPDATE OR DELETE ON
      public.control_g FOR EACH ROW EXECUTE PROCEDURE public.control_g_update();

