package com.study.raum.setting.master;

import com.study.raum.domain.members.Member;
import com.study.raum.domain.system.SystemComponent;
import com.study.raum.setting.master.interfacies.IMasterFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.ArrayList;
import java.util.List;

/**
 * @author kuh
 * @since 2020.04.15
 */

public class MasterDataInteror  {


    private List<MasterDataInertHolder> masterDatas;

    private MasterDataFactory masterDataFactory;

    private List<SystemComponent> systemComponents;

    public MasterDataInteror(){
        if( this.masterDatas != null){
            this.masterDatas = new ArrayList<>();

        }
    }

}
