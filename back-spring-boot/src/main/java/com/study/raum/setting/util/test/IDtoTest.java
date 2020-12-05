package com.study.raum.setting.util.test;

/**
 * IDtoTest
 *
 * V-Model 테스트 단계
 *
 *  순서   | 인터페이스 명    | 패키지명     | 기능
 *  ---------------------------------------------------------------------
 * level1 | IDtoTest       | dto        | dto <-> entity Mapping Test
 * level2 | IRepoTest      | repo       | customRepository Test
 * level3 | IServiceTest   | service    | Service Test
 * level4 | IContTest      | controller | Controller Test  (Integration Test)
 *
 * @author Kimuihyeon
 * @since 2020.12.04
 */

public interface IDtoTest {


    void dto로_변환_test();
    void entity로_변환_test();
    void dto로_변환후_entity로_변환_test();

}
