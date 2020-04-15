package com.study.raum.domain.members;

import com.study.raum.setting.util.test.IUihyeonJapTest;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Sort;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;


/**
 * JapRepository Test Class
 * @author kuh
 * @since 2020.03.08
 */

@RunWith(SpringRunner.class)
@SpringBootTest
public class SupplierRepositoryTest implements IUihyeonJapTest {

    @Resource
    private SupplierRepository supplierRepository;

    @Test
    @Rollback
    @Override
    public void jpaTest() {
        //given
        List<Supplier> collection = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            Supplier su = Supplier.builder()
                    .address1("경기도 수원시")
                    .address2("팔달구 권광로 231" + i)
                    .postNumber("5514" + i)
                    .companyName("kuh company" + i)
                    .ceoName("kuh")
                    .build();

            collection.add(su);
        }
        this.supplierRepository.saveAll(collection);

        //when
        List<Supplier> suppliers = this.supplierRepository.findAll(Sort.by("id").descending());
        suppliers.forEach(t->{
            LoggerUtil.sout(t.toString());
        });

        //than
        assertThat(suppliers).isNotNull();
        assertThat(suppliers.size()).isEqualTo(collection.size());
    }
}
